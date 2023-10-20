import 'package:flutter/material.dart';

import '../Style/app_style.dart';

class ImpressumPage extends StatelessWidget {
  const ImpressumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
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
            iconTheme: IconThemeData(
              color: Styles.primaryColor,
              size: 40,
            ),
            elevation: 0.0,
            centerTitle: true,
            toolbarHeight: 100,
          ),
          body: Center(
            child: Container(
              color: const Color.fromARGB(137, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'MusicaFemina',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 18),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
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
                            const Text(
                              'die Kulturabteilung der Stadt Wien',
                            ),
                            const SizedBox(height: 30),
                            Center(
                                child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Expanded(
      child: SizedBox(
        height: height * 0.3,
        child: Image.asset(
          'assets/images/Stadt-Wien_Logo_pos_rgb.gif',
          fit: BoxFit.contain,
        ),
      ),
    ),
    const SizedBox(width: 16),
    Expanded(
      child: SizedBox(
        height: height * 0.3,
        child: Image.asset(
          'assets/images/mf_logo_B.png',
          fit: BoxFit.contain,
        ),
      ),
    ),
  ],
)
),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
