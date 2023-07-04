import 'dart:convert';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Util {
  static void showSuccessMessage(String title) {
    BotToast.showSimpleNotification(
      title: title,
      backgroundColor: const Color(0xff6d67e4),
      hideCloseButton: true,
    );
  }

  static void showMessage(String title) {
    BotToast.showSimpleNotification(
      title: title,
      hideCloseButton: true,
    );
  }

  static void showErrorMessage(String title) {
    BotToast.showSimpleNotification(
      title: title,
      backgroundColor: const Color(0xffFF5D5D),
      hideCloseButton: true,
    );
  }

  /* static String getCoverUrl(String? id) {
    final global = Global();
    if (id != null) {
      return '${global.baseUrl}/rest/getCoverArt?u=${global.username}&t=${global.subsonicToken}&s=${global.salt}&id=$id&v=${global.subsonic?.version ?? '1.16.1'}&c=${global.appName}';
    }
    return 'https://y.qq.com/mediastyle/global/img/album_300.png';
  } */

  static String md5RandomString() {
    final randomNumber = Random().nextDouble();
    final randomBytes = utf8.encode(randomNumber.toString());
    final randomString = md5.convert(randomBytes).toString();
    return randomString;
  }

  /* static String generateStream(String id) {
    final global = Global();
    return '${global.baseUrl}/rest/stream?u=${global.username}&t=${global.subsonicToken}&s=${global.salt}&id=$id&v=${global.subsonic?.version ?? '1.16.1'}&c=${global.appName}';
  } */

  static String addZero(int num) => num >= 10 ? num.toString() : '0$num';

  static String formatDuration(int duration) {
    final minutes = Duration(seconds: duration).inMinutes;
    final seconds = duration - minutes * 60;
    return '${addZero(minutes)}:${addZero(seconds)}';
  }
}
