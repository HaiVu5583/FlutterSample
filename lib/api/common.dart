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
    "IS-OPEN-GPS": 'false'
  };
}

//Future<http.Response> get() {
//  return null;
//}

//Future<bool> save(HttpClient client, String name, List<int> content) async {
//  try {
//    final Uri uri = new Uri.https(uriAuthority, uriPath, <String, String>{
//      'uploadType': 'media',
//      'name': name,
//    });
//    final HttpClientRequest request = await client.postUrl(uri);
//    request
//      ..headers.contentType = new ContentType('image', 'png')
//      ..headers.add('Authorization', 'Bearer $authorizationToken')
//      ..add(content);
//
//    final HttpClientResponse response = await request.close().timeout(timeLimit);
//    if (response.statusCode == HttpStatus.OK) {
//      logMessage('Saved $name');
//      await response.drain<Null>();
//    } else {
//      // TODO(hansmuller): only retry on 5xx and 429 responses
//      logMessage('Request to save "$name" (length ${content.length}) failed with status ${response.statusCode}, will retry');
//      logMessage(await response.transform(utf8.decoder).join());
//    }
//    return response.statusCode == HttpStatus.OK;
//  } on TimeoutException catch (_) {
//    logMessage('Request to save "$name" (length ${content.length}) timed out, will retry');
//    return false;
//  }
//}

Future<dynamic> post(String url, bodyObj, [String baseUrl]) async {
  if (baseUrl == null) {
    baseUrl = _getServerUrl();
  }

  // Setup Headers

  Map<String, String> headers = _getHeader();
  String jsonBody = jsonEncode(bodyObj);
  String timeStamp =
      (new DateTime.now().millisecondsSinceEpoch / 1000).floor().toString();
  String xAuthStr = (url) +
      headers['X-UNIQUE-DEVICE'] +
      headers['X-DATA-VERSION'] +
      headers['X-VERSION'] +
      timeStamp +
      SECRET_KEY +
      jsonBody;
  String xAuth = sha256.convert(utf8.encode(xAuthStr)).toString();
  headers['X-AUTH'] = xAuth;
  headers['X-TIMESTAMP'] = timeStamp;

//  Uri uri = new Uri.https('pre-production-v2.clingme.vn', '/v2/signin', bodyObj);
//  print(uri.toString());
//
//  final HttpClient client = new HttpClient();
//  final HttpClientRequest request = await client.postUrl(uri);
//  request
//    ..headers.contentType = new ContentType('application', 'json')
//    ..headers.add('X-DEVICE',
//        'ANDROID_APA91bHuL0Rzp_ciLzyzuihhimp71svfisNOU77k7rMg4wn3Fzt2DUmvKJw4L9HilH_l6OtK16ELYnqshOqxbL-shVAJDXCAKnkiqwd7-BJ00W2jyhQn0SY')
//    ..headers.add('X-UNIQUE-DEVICE', 'f445f833d68b3a0e3b87832a0fe792e9')
//    ..headers.add('Accept', 'application/json')
//    ..headers.add('X-AUTH', xAuth)
//    ..headers.add('X-TIMESTAMP', timeStamp)
//    ..headers.add("X-NO-SESSION", "")
//    ..headers.add("Cookie", "")
//    ..headers.add("X-KEYWORD-RESOURCE-VERSION", 3)
//    ..headers.add("X-VERSION", "Android-2.1.23-dev")
//    ..headers.add("X-MAP-RESOURCE-VERSION", 3)
//    ..headers.add("X-INFO", "react view")
//    ..headers.add("X-LOCATION", "0.0, 0.0")
//    ..headers.add("X-DATA-VERSION", 1)
//    ..headers.add("X-LANGUAGE", "vi")
//    ..headers.add("X-CATE-RESOURCE-VERSION", -1)
//    ..headers.add("X-SCREEN-SIZE", "1080x1860")
//    ..headers.add("IS-OPEN-GPS", false);
//
//  print('Request Header: ' + request.headers.toString());
//  final HttpClientResponse response =
//      await request.close().timeout(Duration(milliseconds: 30000));
//  print('Response: ' + response.statusCode.toString());
//  String body = await response.transform(utf8.decoder).join();
//  print('Body: ' + body);


  final http.Response response = await http.post(
      baseUrl + url,
      headers: headers,
      body: bodyObj
  );
  print('Response: ' + response.body);
  print('Header: ' + response.headers.toString());
  return response;
}
