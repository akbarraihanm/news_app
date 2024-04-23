import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/main.dart';

class AppUtil {
  static bindingInstance(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }

  static Future openBottomSheet(BuildContext context, Widget child) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      enableDrag: true,
      builder: (_) => child,
    );
  }

  static void forceCloseApp(String msg) {
    bindingInstance(() {
      Fluttertoast.showToast(msg: msg);
      Navigator.popUntil(navigatorKey.currentContext!, (route) => route.isFirst);
      exit(100);
    });
  }
}