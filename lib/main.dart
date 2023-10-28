import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicafemina/Pages/menu.dart';


void main() {
  runApp(const MusicaFemina());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MusicaFemina extends StatelessWidget {
  const MusicaFemina({Key? key}) : super(key: key);

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
      home: const Menu(paramHomepage: 'menu'),
    );
  }
}

//TODO: Alle Wege Testen -> Bilder,Audio,Texte usw.
//TODO: Unötigen audio löschen in Wiener audios
//TODO: Anordnung Name -> adresse überall gleich machen