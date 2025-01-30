import 'dart:io';
import 'package:flip_coin/utils/theme.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api/call.api.dart';
import 'modules/home/view/home.view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  ApiCall.configureDio();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemesUtil.light,
      home: HomeView(),
    );
  }
}
