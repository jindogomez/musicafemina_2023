import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = const Color.fromARGB(255, 171, 0, 0);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color.fromARGB(255, 0, 0, 0);
  static Color navColor = const Color.fromARGB(255, 243, 233, 233);
  static Color bgColor = const Color.fromARGB(255, 234, 234, 234);
  static TextStyle textStyle = TextStyle(
      fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w500);
//colors for polylines
  static Color polyColorBaker = const Color.fromARGB(255, 171, 0, 0);
  static Color polyColorClara = const Color.fromARGB(255, 171, 0, 0);
  static Color polyColorStrauss = const Color.fromARGB(255, 171, 0, 0);
  static TextStyle headline = TextStyle(
      fontSize: 25,
      fontFamily: GoogleFonts.abel().fontFamily,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle textStyle1 = TextStyle(
    fontSize: 20,
    fontFamily: GoogleFonts.abel().fontFamily,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textMain = TextStyle(
    fontSize: 18,
    fontFamily: GoogleFonts.abel().fontFamily,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
