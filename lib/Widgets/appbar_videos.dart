import 'package:flutter/material.dart';
import 'package:musicafemina/Style/app_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool isCardVisible;
  final VoidCallback toggleCardVisibility;
  final VoidCallback disposeAudio;
  final Widget Function() mapBuilder;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.isCardVisible,
    required this.toggleCardVisibility,
    required this.disposeAudio,
    required this.mapBuilder,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: Styles.primaryColor,
      centerTitle: true,
      toolbarHeight: 100,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Styles.primaryColor,
        onPressed: () {
          if (isCardVisible) {
            toggleCardVisibility();
          } else {
            disposeAudio();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => mapBuilder()),
            );
          }
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
