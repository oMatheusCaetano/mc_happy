import 'package:flutter/material.dart';

import 'package:mc_happy/view/pages/home/home.dart';

void main() {
  runApp(const McHappy());
}

class McHappy extends StatelessWidget {
  const McHappy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MC Happy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2F3F5),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color(0xFFF9FAFC),
          foregroundColor: Color(0xFF8FA7B2),
        )
      ),
      home: const Home(),
    );
  }
}
