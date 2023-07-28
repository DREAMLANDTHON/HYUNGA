import 'dart:convert';
import 'package:http/http.dart' as http;

class Papago{

  static Future<String> language(String text) async {
    Map<String, String> headers = {
      "X-Naver-Client-Id" : "6iXNmTNDaRpbIdyyw6Pc",
      "X-Naver-Client-Secret" : "22wE1A6yKd",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    http.Response response = await http.post(
      Uri.parse("https://openapi.naver.com/v1/papago/detectLangs"),
      headers: headers,
      body: {
        "query" : text,
      },
    );

    if(response.statusCode != 200){
      print(response.statusCode);
      throw Exception;
    }

    Map<String, dynamic> result = json.decode(response.body);
    return result['langCode'];
  }

  // papago 번역 api url
  static Future<String> translateText(String settingLang, String text) async {
    String source = "";
    String target = "";
    String langCode = "";

    await language(text).then((value) => langCode = value);

    if(langCode == "ko") {
      source = "ko";
      target = settingLang;
    } else {
      source = settingLang;
      target = "ko";
    }

    Map<String, String> headers = {
      "X-Naver-Client-Id" : "b0yN0QNZyHG_kgQvu6wu",
      "X-Naver-Client-Secret" : "9PX6PIS1SY",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    http.Response response = await http.post(
        Uri.parse("https://openapi.naver.com/v1/papago/n2mt"),
        headers: headers,
        body: {
          "source" : source,
          "target" : target,
          "text": text,
        },
    );

    if(response.statusCode != 200){
      print(response.statusCode);
      throw Exception;
    }

    Map<String, dynamic> result = json.decode(response.body);
    return result['message']['result']['translatedText'];
  }

}