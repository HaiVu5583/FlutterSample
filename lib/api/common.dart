import 'package:http/http.dart' as http;
import 'dart:async';
import 'constants.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:io';

String _getServerUrl() {
  return (MODE == 'DEV')
      ? DEVELOPMENT_SERVER_ADDRESS
      : ((MODE == 'BETA')
          ? PREPRODUCTION_SERVER_ADDRESS
          : PRODUCTION_SERVER_ADDRESS);
}

Map<String, String> _getHeader() {
  return {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "X-AUTH":
        "a729287565fae7733accbea9757a871e869c0ff8eb6bb1ddaac616677c42e919",
    "X-TIMESTAMP": '1527256897',
    "X-NO-SESSION": "",
    "X-DEVICE":
        "ANDROID_APA91bHuL0Rzp_ciLzyzuihhimp71svfisNOU77k7rMg4wn3Fzt2DUmvKJw4L9HilH_l6OtK16ELYnqshOqxbL-shVAJDXCAKnkiqwd7-BJ00W2jyhQn0SY",
    "Cookie": "",
    "X-KEYWORD-RESOURCE-VERSION": '3',
    "X-VERSION": "Android-2.1.23-dev",
    "X-MAP-RESOURCE-VERSION": '3',
    "X-UNIQUE-DEVICE": "f445f833d68b3a0e3b87832a0fe792e9",
    "X-INFO": "react view",
    "uploadServer": "",
    "X-LOCATION": "0.0, 0.0",
    "X-DATA-VERSION": '1',
    "X-LANGUAGE": "vi",
    "X-CATE-RESOURCE-VERSION": '-1',
    "X-SCREEN-SIZE": "1080x1860",
    "IS-OPEN-GPS": 'false',
  };
}

String _getQueryParam(Map<String, String> params) {
  String query = "?";
  params.forEach((key, value) {
    query += "$key=$value&";
  });
  return query;
}

Future<dynamic> post(String url, bodyObj, [String baseUrl]) async {
  if (baseUrl == null) {
    baseUrl = _getServerUrl();
  }

  // Setup Headers

  Map<String, String> headers = _getHeader();
  String jsonBody = jsonEncode(bodyObj);
  print("Post URL: " + baseUrl + url);
  print("Post BODY: " + jsonBody);
  String timeStamp =
      (new DateTime.now().millisecondsSinceEpoch / 1000).floor().toString();
  String xAuthStr =
      "$url$headers['X-UNIQUE-DEVICE']$headers['X-DATA-VERSION']$headers['X-VERSION']$timeStamp$SECRET_KEY$jsonBody";
  String xAuth = sha256.convert(utf8.encode(xAuthStr)).toString();
  headers['X-AUTH'] = xAuth;
  headers['X-TIMESTAMP'] = timeStamp;
  http.Response response =
      await http.post(baseUrl + url, body: jsonBody, headers: headers);
  String body = utf8.decode(response.bodyBytes);
  return body;
}

Future<dynamic> get(String url, Map<String, String> params,
    [String baseUrl]) async {
  if (baseUrl == null) {
    baseUrl = _getServerUrl();
  }

  // Setup Headers

  Map<String, String> headers = _getHeader();
  String timeStamp =
      (new DateTime.now().millisecondsSinceEpoch / 1000).floor().toString();
  String xAuthStr =
      "$url$headers['X-UNIQUE-DEVICE']$headers['X-DATA-VERSION']$headers['X-VERSION']$timeStamp$SECRET_KEY";
  String xAuth = sha256.convert(utf8.encode(xAuthStr)).toString();
  headers['X-AUTH'] = xAuth;
  headers['X-TIMESTAMP'] = timeStamp;
  String getUrl = url + baseUrl + _getQueryParam(params);
  print("Get URL: " + getUrl);
  http.Response response = await http.post(getUrl, headers: headers);
  String body = utf8.decode(response.bodyBytes);
  return body;
}
