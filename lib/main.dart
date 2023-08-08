import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';

void main() {
  runApp(const MusicaFemina());
}

class MusicaFemina extends StatelessWidget {
  const MusicaFemina({Key? key}) : super(key: key); // corrected here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 40),
        ),
      ),
      // loaded home menu
      home: const SplashPage(paramHomepage: 'Home'),
    );
  }
}
