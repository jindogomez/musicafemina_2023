import 'package:flutter/material.dart';
import 'package:musicafemina/Style/app_style.dart';

class CustomAppBarVideos extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double height;

  const CustomAppBarVideos({
    super.key,
    required this.title,
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
        color: Styles.primaryColor,
        onPressed: () {
          Navigator.of(context).pop();
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
