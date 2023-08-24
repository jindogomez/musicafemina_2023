import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomAppBarVideos extends StatelessWidget
    implements PreferredSizeWidget {
  final YoutubePlayerController controller;
  final String title;
  final double height;

  final VoidCallback exitFullScreen;

  const CustomAppBarVideos({
    super.key,
    required this.controller,
    required this.title,
    required this.exitFullScreen,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80.0); // set height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      toolbarHeight: 80,
      leading: BackButton(
        onPressed: () {
          Navigator.of(context).pop();
          controller.pause();
          exitFullScreen();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'abel',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
