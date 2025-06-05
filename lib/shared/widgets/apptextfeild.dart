// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/extension/space_ext.dart';

import '../../core/theme/app_colors.dart';
// import '../../core/helper/help_screensize.dart'; // This import seems unused and can be removed if not used elsewhere.

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.obscure,
    this.hinttext,
    this.isobsecure,
    this.type,
    this.formFieldValidator,
    this.height,
    this.width,
    this.vcontentpadding,
    this.prefix,
    this.suffix,
    this.inputFormater,
    this.readonly,
    this.onTap,
    this.onChanged,
    this.onvalidate,
    this.contentalign,
    this.borderstyle, // This is where you pass your custom border
    this.errorborder, 
    this.filledcolor,
    this.hintStyle,
    this.hintfontSize,
    this.textstyle,
    this.labelshow,
    this.digitsonly,
    this.contentPadding,
    this.maxLength,
    this.multiline = 1,
    this.isrequired = false,
  });

  final TextEditingController controller;
  final String? label, hinttext;
  final TextInputType? type;
  final bool? obscure; // This seems unused if isobsecure is used
  final TextStyle? textstyle, hintStyle;
  final bool? isobsecure, readonly, labelshow, digitsonly, isrequired;
  final Widget? suffix, prefix;
  final double? height, width, vcontentpadding , hintfontSize;
  final int? multiline;
  final int? maxLength;
  final Color? filledcolor;
  final EdgeInsets? contentPadding;
  final TextAlign? contentalign;
  final List<TextInputFormatter>? inputFormater;
  final InputBorder? borderstyle; // Allows custom border, including radius
  final InputBorder? errorborder; // Allows custom border, including radius
  final FormFieldValidator? formFieldValidator; // Seems unused, consider removing or using
  final Function()? onTap;
  final Function(String value)? onChanged;
  final String? Function(String? value)? onvalidate;

  @override
  Widget build(BuildContext context) {
    // ScreenUtils.init(context); // Initialize ScreenUtil once in main.dart or a common place, not every build
    return Container
  (
      // The Container itself doesn't directly control the TextField's border radius
      // It can be used for external decoration if needed, but for TextField border,
      // the InputDecoration's border properties are the way to go.
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap, // Allows the whole area to be tappable for onTap
        child: TextFormField(
          maxLength: maxLength,
          onTap: onTap, // onTap for the TextFormField itself
          onChanged: onChanged,
          obscureText: isobsecure ?? false,
          validator: onvalidate,
          enableSuggestions: false,
          scribbleEnabled: false,
          controller: controller,
          keyboardType: type ?? TextInputType.text,
          readOnly: readonly ?? false,
          maxLines: multiline != 1 ? multiline! * 2 : multiline,
          textAlignVertical: TextAlignVertical.center,
          style: textstyle ??
              GoogleFonts.poppins(
                color: AppColors.textcolor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp
              ),
          inputFormatters: inputFormater != null
              ? inputFormater
              : digitsonly == true
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp(r'^\d*\.?\d*'),
            ),
          ]
              : [],

          textAlign: contentalign ?? TextAlign.start,
          decoration: InputDecoration(
prefixIcon: prefix,
// prefix: prefix,
            
            suffixIconConstraints: const BoxConstraints(), // To control suffix icon sizing
            contentPadding: contentPadding?? EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: vcontentpadding ?? 16.h, // Use vcontentpadding if provided
            ),
            filled: filledcolor == null ? false : true,
            fillColor: filledcolor,
            hintText: hinttext,
            hintStyle: hintStyle ??
                GoogleFonts.poppins(
                  color: AppColors.hintcolor,
                  fontWeight: FontWeight.w400,
                  
                  fontSize:hintfontSize?? 14.sp,
                ),
            // Add padding to the hint text
            isDense: true,
            hintFadeDuration: const Duration(milliseconds: 200),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: true,
            suffixIcon: Padding(
              padding:  EdgeInsets.only(right: 18.w),
              child: suffix ?? 0.hBox, // Assuming 0.hBox is a SizedBox.shrink() or similar
            ),
            labelText: label,
            labelStyle: GoogleFonts.poppins(
              color: AppColors.blackcolor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            // Default border when borderstyle is not provided
            border: borderstyle ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r), // Default radius
                  borderSide: const BorderSide(
                    color: AppColors.textfeildborder,
                    // width: 0.42,
                  ),
                ),
            // Focused border
            focusedBorder: borderstyle ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r), // Default radius
                  borderSide: const BorderSide(
                    color: AppColors.textfeildborder,
                    // width: 0.42,
                  ),
                ),
            // Enabled border
            enabledBorder: borderstyle ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r), // Default radius
                  borderSide: const BorderSide(
                    color: AppColors.textfeildborder,
                    // width: 0.42,
                  ),
                ),
            errorBorder: errorborder
          ),
        ),
      ),
    );
  }
}