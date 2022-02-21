import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFrave extends StatelessWidget {
  //--TextFrave--//
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow textOverflow;
  final int maxLines;
  final TextAlign textAlign;

  //--Contrctor--//
  const TextFrave(
      {required this.text,
      this.fontSize = 18,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textOverflow = TextOverflow.visible,
      this.maxLines = 1,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont('Roboto',
          fontSize: fontSize, fontWeight: fontWeight, color: color),
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
