import 'package:flutter/material.dart';

class ImpressumPage extends StatelessWidget {
  const ImpressumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mf_main_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Impressum'),
            actions: [
              Image.asset(
                'assets/images/mf_logo.png',
                fit: BoxFit.cover,
                height: 80,
              ),
              const SizedBox(
                  width:
                      16), // To add some space on the right side of the title
            ],
            backgroundColor: const Color.fromARGB(137, 255, 255, 255),
            iconTheme: const IconThemeData(
              color: Colors.red,
              size: 40,
            ),
            elevation: 0.0,
            centerTitle: true,
            toolbarHeight: 100,
          ),
          body: Container(
            color: const Color.fromARGB(137, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 16),
                  const Text(
                    'MusicaFemina',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                      'Wir sind dankbar für inhaltliche Ergänzungen und Feedback unter:'),
                  const Text('@maezenatentum.at'),
                  const SizedBox(height: 10),
                  const Text('Wie wir gearbeitet haben:'),
                  const Text('www.musicafemina.at'),
                  const SizedBox(height: 16),
                  const Text(
                    ' Für den Inhalt verantworlich:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Verein Mäzenatentum.at'),
                  const Text('Institut für künstlerische Forschung'),
                  const Text('Martinstraße 91'),
                  const Text('1180 Wien'),
                  const Text('office@maezenatentum.at'),
                  const Text('www.musicafemina.at'),
                  const SizedBox(height: 16),
                  const Text('Spendenkonto:'),
                  const Text('IBAN: AT06 2011 1288 1692 0300'),
                  const Text(
                    'BIC: GIBAATWWXXX',
                  ),
                  const Text(
                    'Erste Bank',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'gefördert durch:',
                  ),
                  const Text('die Kulturabteilung der Stadt Wien'),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                            'assets/images/Stadt-Wien_Logo_pos_rgb.gif',
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 16), // Spacing between images
                      Expanded(
                        child: Image.asset('assets/images/mf_logo_B.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}