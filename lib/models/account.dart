import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tiny_music/server_data/fetch.dart';
import 'package:tiny_music/utils/util.dart';

class Account {
  String _baseUrl = '';
  String username = '';
  String _password = '';
  String appName = 'TinyMusic';
  String _subsonicToken = '';
  String _salt = '';
  String? version;

  static final Account _singleton = Account._internal();

  factory Account() => _singleton;

  Account._internal();

  String get baseUrl => _baseUrl;

  set baseUrl(String url) {
    _baseUrl = url;
    Fetch().setBaseUrl(url);
  }

  String get subsonicToken => _subsonicToken;
  String get salt => _salt;

  String get password => _password;

  set password(String password) {
    _password = password;
    _salt = Util.md5RandomString();
    _subsonicToken = md5.convert(utf8.encode('$password$_salt')).toString();
  }

  resetAccount() {
    baseUrl = '';
    username = '';
    password = '';
    _subsonicToken = '';
    _salt = '';
    version = null;
  }

  saveToHive() {}

  getFromHive() {}
}
