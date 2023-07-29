import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:like_button/like_button.dart';

class ImageNotifyScreen extends StatefulWidget {
  const ImageNotifyScreen({Key? key}) : super(key: key);

  @override
  State<ImageNotifyScreen> createState() => _ImageNotifyScreenState();
}

class _ImageNotifyScreenState extends State<ImageNotifyScreen> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  String scannedText = "";
  String _parsedtext = '';
  String _translatedText = '';
  String _chatGptResponse = '';

  Future _getFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    setState(() {
      _image =
          pickedFile; // This line updates the _image file with the picked image.
    });

    var bytes = File(pickedFile.path.toString()).readAsBytesSync();
    String img64 = base64Encode(bytes);

    var url = 'https://api.ocr.space/parse/image';
    var payload = {
      "base64Image": "data:image/jpg;base64,${img64.toString()}",
      "language": "kor"
    };
    var header = {"apikey": "K81406944688957"};

    var post = await http.post(Uri.parse(url), body: payload, headers: header);
    var result = jsonDecode(post.body);

    setState(() {
      _parsedtext = result['ParsedResults'][0]['ParsedText'];
      _chatGpt(_parsedtext); // The parsed text is passed to the chatGPT API
    });
  }

  Future<void> _chatGpt(String text) async {
    var url = 'https://api.openai.com/v1/engines/text-davinci-003/completions';
    var header = {
      "Authorization":
          "Bearer API_KEY",
      "Content-Type": "application/json"
    };
    var payload = jsonEncode(
        {"prompt": "paraphrase in english about {$text}", "max_tokens": 200});

    var post = await http.post(Uri.parse(url), body: payload, headers: header);
    var result = jsonDecode(post.body);

    if (result != null &&
        result.containsKey('choices') &&
        result['choices'].isNotEmpty) {
      setState(() {
        _chatGptResponse = result['choices'][0]['text'].trim();
      });
    } else {
      print('Error with API response: $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor('#f5eee6'),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                _buildPhotoArea(),
                SizedBox(height: 20),
                _buildRecognizedText(),
                SizedBox(height: 20),
                _buildChatGptResponse(),
                SizedBox(height: 50),
                _buildLikeButton(),
                SizedBox(height: 20),
                _buildButton(),
                SizedBox(height: 20),
                _buildBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(_image!.path),
              width: double.infinity,
              height: 300,
              fit: BoxFit
                  .scaleDown, // Changed from BoxFit.cover to BoxFit.scaleDown
            ),
          )
        : Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'Please upload a photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: HexColor('#0b4e25')
              ),
            ),
          );
  }

  Widget _buildRecognizedText() {
    return Container(
      child: Column(
        children: [
          if(_parsedtext != "")
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 2,
                width: 110,
                color: HexColor('#0b4e25'),
              ),
              Text('  Text Scan  ', style: TextStyle(
                color: HexColor('#0b4e25'),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 2,
                width: 110,
                color: HexColor('#0b4e25'),
              ),
            ],
          ),
          Text(
            _parsedtext,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildChatGptResponse() {
    return Container(
      child: Column(
        children: [
          if(_chatGptResponse != "")
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 2,
                width: 120,
                color: HexColor('#0b4e25'),
              ),
              Text('  Summary  ', style: TextStyle(
                  color: HexColor('#0b4e25'),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              Container(
                margin: EdgeInsets.only(top: 3),
                height: 2,
                width: 120,
                color: HexColor('#0b4e25'),
              ),
            ],
          ),
          Text(
            _chatGptResponse,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton() {
    return Container(
      child: Column(
        children: [
          if(_parsedtext != "" && _chatGptResponse != "")
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Are you satisfied?', style: TextStyle(
                color: HexColor('#0b4e25'),
                fontSize: 20,
              ),),
              SizedBox(width: 10,),
              LikeButton(
                size: 25,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: HexColor('#0b4e25')),
      onPressed: () {
        _getFromGallery();
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "UPLOAD",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: HexColor('#0b4e25')),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "BACK",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
