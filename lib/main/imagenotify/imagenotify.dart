import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    setState(() {
      _image = pickedFile;  // This line updates the _image file with the picked image.
    });

    var bytes = File(pickedFile.path.toString()).readAsBytesSync();
    String img64 = base64Encode(bytes);

    var url = 'https://api.ocr.space/parse/image';
    var payload = {"base64Image": "data:image/jpg;base64,${img64.toString()}","language" :"kor"};
    var header = {"apikey" :"K81406944688957"};

    var post = await http.post(Uri.parse(url),body: payload,headers: header);
    var result = jsonDecode(post.body);

    setState(() {
      _parsedtext = result['ParsedResults'][0]['ParsedText'];
      _chatGpt(_parsedtext);  // The parsed text is passed to the chatGPT API
    });
  }

  Future<void> _chatGpt(String text) async {
    var url = 'https://api.openai.com/v1/engines/text-davinci-003/completions';
    var header = {"Authorization" :"Bearer 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",
      "Content-Type": "application/json"};
    var payload = jsonEncode({"prompt": "paraphrase in english about {$text}", "max_tokens": 200});

    var post = await http.post(Uri.parse(url),body: payload,headers: header);
    var result = jsonDecode(post.body);

    if (result != null && result.containsKey('choices') && result['choices'].isNotEmpty) {
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
        appBar: AppBar(title: Text("Image to Text Translator")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildPhotoArea(),
                SizedBox(height: 20),
                _buildRecognizedText(),
                SizedBox(height: 20),
                _buildChatGptResponse(),
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
        fit: BoxFit.scaleDown,  // Changed from BoxFit.cover to BoxFit.scaleDown
      ),
    )
        : Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey,
    );
  }

  Widget _buildRecognizedText() {
    return Text(
      _parsedtext,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildChatGptResponse() {
    return Text(
      _chatGptResponse,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        _getFromGallery();
      },

      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "갤러리",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
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
