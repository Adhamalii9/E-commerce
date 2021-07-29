import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final Alignment alignment;
  final String font;
  final int maxLines;

  CustomText(
      {this.text,
      this.font,
      this.size,
      this.color,
      this.fontWeight,
      this.alignment = Alignment.topLeft,
      this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: font

        ),
        maxLines: maxLines,

      ),
    );
  }
}
