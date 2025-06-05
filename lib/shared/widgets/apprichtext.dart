import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';

class AppRichText extends StatelessWidget {
  final String normalText;
  final String richText;
  final String? fontFamily,richfontFamily;
  final Color normalTextColor, richTextColor,txtdeccolor,richtxtdeccolor;
  final FontWeight richFontWeight, normalFontWeight;
  final double? fontSize, richTextFontSize;
  final double? letterspace, richletterspace;
  final TextDecoration? textdec,richtextdec;
  final GestureRecognizer? recognizer;
  const AppRichText(
      {super.key,
      required this.normalText,
      required this.richText,
      this.fontFamily,this.richfontFamily,
      this.normalTextColor = Colors.black,
      this.richTextColor = Colors.black,
      this.normalFontWeight = FontWeight.w300,
      this.richFontWeight = FontWeight.normal,
      this.fontSize,
      this.richTextFontSize,
      this.letterspace,
      this.richletterspace,
      this.textdec,
      this.richtextdec,
      this.txtdeccolor=AppColors.textcolor,
      this.richtxtdeccolor = AppColors.textcolor,
      this.recognizer

      });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 2,
      TextSpan(
        children: [
          TextSpan(
              text: normalText,
              style:fontFamily==''?GoogleFonts.poppins(
                  color: normalTextColor,
                  fontSize: fontSize ?? 12,
                  fontWeight: normalFontWeight,
                  decorationColor: txtdeccolor,
                  decoration: textdec,
                 
                  letterSpacing: letterspace): GoogleFonts.poppins(
                  color: normalTextColor,
                  fontSize: fontSize ?? 12,
                  fontWeight: normalFontWeight,
                  decorationColor: txtdeccolor,
                  decoration: textdec,
                 
                  letterSpacing: letterspace)),
          TextSpan(
            text: richText,
            recognizer: recognizer,
            style:fontFamily==''? GoogleFonts.inter(
                color: richTextColor,
                fontSize: richTextFontSize ?? (fontSize ?? 12),
                fontWeight: richFontWeight,
               
                decoration: richtextdec,
                decorationColor: richtxtdeccolor,
                letterSpacing: richletterspace): GoogleFonts.poppins(
                color: richTextColor,
                fontSize: richTextFontSize ?? (fontSize ?? 12),
                fontWeight: richFontWeight,
               
                decoration: richtextdec,
                decorationColor: richtxtdeccolor,
                letterSpacing: richletterspace)
          ),
        ],
      ),
    );
  }
}