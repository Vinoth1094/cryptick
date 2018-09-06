import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cryptick/dependency_injection.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cryptick/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      Injector.configure(Flavor.PROD);
      runApp(new MyApp());
    });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}
