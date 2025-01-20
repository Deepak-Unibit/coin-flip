import 'package:flip_coin/modules/home/view/home.view.dart';
import 'package:flip_coin/utils/theme.util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemesUtil.light,
      home: HomeView(),
    );
  }
}
