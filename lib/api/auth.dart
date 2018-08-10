import 'dart:async';
import 'common.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future<dynamic> login() async {
  return post('/v2/signin', {
    'input': 'clingmetest@gmail.com',
    'password': md5.convert(utf8.encode('123456789')).toString()
  });
}
