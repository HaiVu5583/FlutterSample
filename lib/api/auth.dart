import 'dart:async';
import 'common.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<dynamic> login() async {
  return post('/v2/signin', {
    'input': 'huethan90@gmail.com',
    'password': md5.convert(utf8.encode('12345678')).toString()
  });
}
