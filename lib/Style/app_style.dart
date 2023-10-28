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
  static Color polyColorBaker = const Color.fromARGB(115, 240, 138, 91);
  static Color polyColorClara = const Color.fromARGB(111, 60, 116, 61);
  static Color polyColorStrauss = const Color.fromARGB(102, 108, 200, 42);
    static Color polyColorNS = const Color.fromARGB(99, 200, 42, 137);
        static Color polyColorWiener = const Color.fromARGB(73, 50, 42, 200);
  static TextStyle headline = TextStyle(
      fontSize: 25,
      fontFamily: GoogleFonts.abel().fontFamily,
      color: primaryColor,
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
