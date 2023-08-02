import 'package:flutter/material.dart';

import 'package:musicafemina/Map/Clara/clara_map.dart';

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
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255), size: 40),
        ),
      ),
      // laded map zurzeit. Muss noch Menü gebaut werden.
      home: const Map(),
    );
  }
}
