import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textTitle({String? data, double? size}) {
  return Text(data!,
      style: GoogleFonts.aBeeZee(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color:  Color.fromARGB(255, 217, 29, 29)));
}

Widget textPoppins({String? data, color}) {
  return Text(data!,
      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: color));
}