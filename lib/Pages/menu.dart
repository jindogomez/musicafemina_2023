import 'package:flutter/material.dart';

import '../MapContent/All/video_urls.dart';
import 'map_baker.dart';
import 'map_clara.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required String paramHomepage});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 100,
        title: Image.asset(
          'assets/images/mf_logo_B.png',
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
      body: Center(
        child: Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.9,
          margin: const EdgeInsets.all(0),
          child: ListView(
            children: <Widget>[
              const ListTile(),
              ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                iconColor: Colors.black,
                tileColor: const Color.fromARGB(255, 240, 138, 91),
                focusColor: Colors.blue,
                hoverColor: Colors.red,
                textColor: Colors.white,
                leading: Image.asset('assets/images/Waypoint_Clara_01.png'),
                title: const Text('Josephine Baker'),
                subtitle: const Text('1819 - 1896'),
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
                tileColor: const Color.fromARGB(255, 60, 116, 61),
                focusColor: Colors.blue,
                hoverColor: Colors.red,
                textColor: Colors.white,
                title: const Text('Clara Wieck Schumann'),
                subtitle: const Text('1819 - 1896'),
                leading: Image.asset('assets/images/Waypoint_Clara_01.png'),
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
            ],
          ),
        ),
      ),
    );
  }
}
