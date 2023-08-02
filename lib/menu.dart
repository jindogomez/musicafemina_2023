import 'package:flutter/material.dart';
import 'Map/Baker/baker_map.dart';
import 'Map/Clara/clara_map.dart';
import 'Services/video_player.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Image.asset(
          'assets/images/mf_logo_B.png',
          fit: BoxFit.cover,
          height: 80,
        ),
      ),
      body: Center(
        child: Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.9,
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const ListTile(),
              ListTile(
                leading: Image.asset('assets/images/Waypoint_Clara_01.png'),
                title: const Text('Baker'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MapBaker()));
                },
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Clara'),
                leading: Image.asset('assets/images/Waypoint_Clara_01.png'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MapClara()));
                },
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Videos'),
                leading: const Icon(Icons.video_collection),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoPlayer()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
