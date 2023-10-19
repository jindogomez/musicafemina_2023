import 'package:flutter/material.dart';
import 'package:musicafemina/MapContent/All/waypoint_images.dart';
import 'package:musicafemina/Pages/map_ns.dart';
import 'package:musicafemina/Pages/map_strauss.dart';
import 'package:musicafemina/Pages/map_wiener.dart';

import '../MapContent/All/video_urls.dart';
import '../Style/app_style.dart';
import 'impressum.dart';
import 'map_baker.dart';
import 'map_clara.dart';

class Menu extends StatelessWidget {
  final String paramHomepage;

  const Menu({Key? key, required this.paramHomepage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/mf_main_bg.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  Image.asset(
                    'assets/images/mf_logo_B.png',
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(137, 255, 255, 255),
              iconTheme: IconThemeData(
                color: Styles.primaryColor,
                size: 40,
              ),
              elevation: 0.0,
              centerTitle: true,
              toolbarHeight: 100,
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.9,
                margin: const EdgeInsets.all(0),
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 0,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Styles.primaryColor],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Stadtspaziergänge:",
                              style: Styles.textMain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 0),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: const Color.fromARGB(115, 240, 138, 91),
                      focusColor: Colors.blue,
                      hoverColor: Colors.red,
                      textColor: Colors.white,
                      leading: Image.asset(
                        WaypointImages().bakerWaypoint,
                      ),
                      title: const Text('Josephine Baker'),
                      subtitle: const Text('1906  - 1975'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapBaker(
                                      videoUrl: VideoUrls().videoBaker,

                                      // Pass the audio object
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: const Color.fromARGB(111, 60, 116, 61),
                      focusColor: Colors.blue,
                      hoverColor: Colors.red,
                      textColor: Colors.white,
                      title: const Text('Clara Wieck Schumann'),
                      subtitle: const Text('1819 - 1896'),
                      leading: Image.asset(
                        WaypointImages().claraWaypoint,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapClara(
                                      videoUrl: VideoUrls().videoClara,
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: const Color.fromARGB(73, 50, 42, 200),
                      focusColor: Colors.blue,
                      hoverColor: Colors.red,
                      textColor: Colors.white,
                      title: const Text('Wiener Klassikerinnen'),
                      subtitle: const Text('1789 - 1919'),
                      leading: Image.asset(
                        WaypointImages().wienerklassikerinnenWaypoint,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapWiener(
                                      videoUrl: VideoUrls().videoClara,
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: const Color.fromARGB(99, 200, 42, 137),
                      focusColor: Colors.blue,
                      hoverColor: Colors.red,
                      textColor: Colors.white,
                      title: const Text('Ns Verfemte'),
                      subtitle: const Text(' 1888 - 1960'),
                      leading: Image.asset(WaypointImages().nsWaypoint),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapNs(
                                      videoUrl: VideoUrls().videoClara,
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: const Color.fromARGB(102, 108, 200, 42),
                      focusColor: Colors.blue,
                      hoverColor: Colors.red,
                      textColor: Colors.white,
                      title: const Text('Strauss Zeitgenossinnen'),
                      subtitle: const Text('1825 - 1899'),
                      leading: Image.asset(WaypointImages().straussWaypoint),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapStrauss(
                                      videoUrl: VideoUrls().videoClara,
                                    )));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Stack(
            children: [
              // workaround für transparente navbar
              BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: SizedBox(width: 24, height: 24), label: ''),
                  BottomNavigationBarItem(
                      icon: SizedBox(width: 24, height: 24), label: ''),
                ],
                backgroundColor: const Color.fromARGB(137, 255, 255, 255),
                elevation: 0.0, // schatten unter navbar
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 5,
                child: SizedBox(
                  height: 50, // höhe navbar bottum
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        // logo wien
                        child: Image.asset(
                          'assets/images/Stadt-Wien_Logo_pos_rgb.gif',
                          width: 80.0,
                          height: 80.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.info,
                          size: 40.0,
                          color: Color.fromARGB(255, 50, 46, 46),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ImpressumPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
