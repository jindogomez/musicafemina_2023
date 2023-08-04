import 'package:flutter/material.dart';

import 'Pages/menu.dart';

void main() {
  runApp(const MusicaFemina());
}

class MusicaFemina extends StatelessWidget {
  const MusicaFemina({
    super.key,
  });

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
      // laded hautmenü
      home: const Menu(),
    );
  }
}
