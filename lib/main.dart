import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lol_summonersearch/app.dart';
import 'package:lol_summonersearch/injection_container.dart' as di;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  di.init();
  runApp(MyApp());
}
