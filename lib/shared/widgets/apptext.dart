import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

enum AppFontFamily { poppins, inter }

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.family,
    this.color,
    this.size,
    this.letterspace,
    this.lineheight,
    this.weight,
    this.textalign,
    this.maxline = 1,
    this.fontstyle,
    this.decoration,
    this.deccolor,
    this.overrideStyle,
  });

  final String text;
  final String? family;
  final Color? color, deccolor;
  final double? size, letterspace,lineheight;
  final FontWeight? weight;
  final TextAlign? textalign;
  final int? maxline;
  final FontStyle? fontstyle;
  final TextDecoration? decoration;
  final TextStyle? overrideStyle;

  String _getFontFamily(String font) {
    switch (font) {
      case "":
        return 'Inter';
      default:
        return 'Poppins';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      textAlign: textalign ?? TextAlign.start,
      style: overrideStyle ==null?
          family == '' ?
          GoogleFonts.inter(
            decoration: decoration,
            decorationColor: deccolor ?? AppColors.facebookblue,
            color: color ?? AppColors.textcolor,
            fontSize: size,
            fontStyle: fontstyle ?? FontStyle.normal,
            fontWeight: weight,
            letterSpacing: letterspace,
            height:lineheight
            // overflow: TextOverflow.ellipsis,
          ):

          GoogleFonts.poppins(
            decoration: decoration,
            decorationColor: deccolor ?? AppColors.facebookblue,
            color: color ?? AppColors.textcolor,
            fontSize: size,
            fontStyle: fontstyle ?? FontStyle.normal,
            fontWeight: weight,
             height:lineheight,
            letterSpacing: letterspace,

          )
          :overrideStyle,
      overflow: TextOverflow.ellipsis,

    );
  }
}
