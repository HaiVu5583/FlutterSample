import 'package:flutter_hello_world/locales/index.dart';

class I18n {
  static I18n _instance;
  String language = 'vi';
  Map<String, dynamic> languageData;

  I18n(String language) {
    this.language = language;
    this.languageData = languages[language];
  }

  t(key) => this.languageData[key] ?? '';

  static getInstance([String language = 'vi']) {
    if (_instance == null) {
      _instance = new I18n(language);
    }
    return _instance;
  }
}
