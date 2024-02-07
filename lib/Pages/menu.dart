import 'package:flutter/material.dart';
import 'package:musicafemina/MapContent/All/waypoint_images.dart';
import 'package:musicafemina/Pages/map_demokratie.dart';
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
                      tileColor: Styles.polyColorBaker,
                      focusColor: Colors.blue,
            hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(
                          WaypointImages().bakerWaypoint,
                        ),
                      ),
                      title: const Text('Josephine Baker'),
     
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapBaker(
                                      videoUrl: VideoUrls().videoBaker,
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: Styles.polyColorClara,
                      focusColor: Colors.blue,
                     hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      title: const Text('Clara Wieck Schumann'),
             
                      leading: Padding(
                       padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(
                          WaypointImages().claraWaypoint,
                        ),
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
                      tileColor: Styles.polyColorWiener,
                      focusColor: Colors.blue,
                     hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      title: const Text('Wiener Klassikerinnen'),
        
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(
                          WaypointImages().wienerklassikerinnenWaypoint,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapWiener(
                                    
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: Styles.polyColorNS,
                      focusColor: Colors.blue,
                     hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      title: const Text('NS Verfemte Komponistinnen '),
            
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(WaypointImages().nsWaypoint),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapNs(
                                  videoUrl: VideoUrls().videoNs,
                                )));
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: Styles.polyColorStrauss,
                      focusColor: Colors.blue,
                      hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      title: const Text('Johann Strauss Zeitgenossinnen'),

                      leading: Padding(
                         padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(WaypointImages().straussWaypoint),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapStrauss(
                                    
                                    )));
                      },
                    ),

                     const SizedBox(height: 10),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      iconColor: Colors.black,
                      tileColor: Styles.polyColorDemokratie, 
                      focusColor: Colors.blue,
                      hoverColor: Styles.primaryColor,
                      textColor: Colors.white,
                      title: const Text('Orte der Demokratie'),

                      leading: Padding(
                         padding: const EdgeInsets.only(top: 2.0, bottom: 2.0), 
                        child: Image.asset(WaypointImages().demokratieWaypoint),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapDemokratie(
                                    
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
                          color: Color.fromARGB(255, 124, 118, 118),
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
