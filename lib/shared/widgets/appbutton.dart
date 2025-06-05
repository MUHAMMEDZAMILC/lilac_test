// ignore_for_file: must_be_immutable, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/extension/space_ext.dart';

import '../../core/helper/help_screensize.dart';
import '../../core/theme/app_colors.dart';
import 'apptext.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      this.child,
      required this.onPressed,
      required this.isValid,
      this.btncolor,
      this.btntxt,
      this.fontsize,
      this.textcolor,
      this.buttonStyle,
      this.isLoading=false,
      this.height,this.width,this.Borderradius});
  Widget? child;
  String? btntxt;
  double? fontsize, Borderradius;
  Color? btncolor, textcolor;
  Function() onPressed;
  ButtonStyle? buttonStyle;
  double? height,width;
  bool isValid,isLoading;
  
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
        width:width?? ScreenUtils.screenWidth,
        height: height ?? 56.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ElevatedButton(
              
                style: buttonStyle ??
                    ButtonStyle(
                     
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.zero),
                        backgroundColor: WidgetStatePropertyAll(
                            btncolor ?? AppColors.primary),
                        shadowColor:  WidgetStatePropertyAll(
                            AppColors.transparent),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Borderradius??45.r),
                        ))),
                onPressed: onPressed,
                child: isLoading == false?  child ??
                    AppText(
                      text: btntxt??'',
                      color: textcolor ?? AppColors.white,
                      size:fontsize?? 14.h,
                      weight: FontWeight.w600,

                    ):0.hBox),
            isValid == true
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.white.withOpacity(0.5),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            AppColors.transparent), shape:WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Borderradius??45.r),
                        ))),
                    onPressed: () {},
                    child: AppText(text: '')),
            isLoading == false
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.blackcolor.withOpacity(0.3),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            AppColors.transparent), shape:WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Borderradius??45.r),
                        ))),
                    onPressed: () {},
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(color: AppColors.white,strokeCap: StrokeCap.round,backgroundColor: AppColors.white.withOpacity(0.5),)),),
          ],
        ));
  }
}



class AppButtonGradient extends StatelessWidget {
  AppButtonGradient({
    super.key,
    this.child,
    required this.onPressed,
    required this.isValid,
    this.btncolor,
    this.btntxt,
    this.fontsize,
    this.textcolor,
    this.buttonStyle,
    this.isLoading = false,
    this.height,
    this.width,
    this.Borderradius,
    this.gradient, // Add gradient parameter
  });

  final Widget? child;
  final String? btntxt;
  final double? fontsize, Borderradius;
  final Color? btncolor, textcolor;
  final Function() onPressed;
  final ButtonStyle? buttonStyle;
  final double? height, width;
  final bool isValid, isLoading;
  final Gradient? gradient; // New parameter for gradient

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return SizedBox(
      width: width ?? ScreenUtils.screenWidth,
      height: height ?? 53.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Main Button with Gradient
          InkWell(
            borderRadius: BorderRadius.circular(Borderradius ?? 59.r),
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xFFFF05C83).withOpacity(0.20),blurRadius: 24.r,offset: Offset(0, 9.w)),],
                gradient: gradient ?? // Use provided gradient or fallback
                    (btncolor != null
                        ? LinearGradient(
                            colors: [btncolor!, btncolor!], // Solid if no gradient
                          )
                        : LinearGradient(
                            colors: [AppColors.primary, AppColors.primarylight],
                         begin:Alignment.bottomCenter,end: Alignment.topCenter )),
                borderRadius: BorderRadius.circular(Borderradius ?? 45.r),
              ),
              child: Center(
                child: isLoading
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          strokeCap: StrokeCap.round,
                          backgroundColor: AppColors.white.withOpacity(0.5),
                        ),
                      )
                    : child ??
                        AppText(
                          text: btntxt ?? '',
                          color: textcolor ?? AppColors.white,
                          size: fontsize ?? 14.h,
                          weight: FontWeight.w600,
                        ),
              ),
            ),
          ),

          // Disabled Overlay
          if (!isValid)
            Container(
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(Borderradius ?? 45.r),
              ),
              child: const Center(),
            ),
        ],
      ),
    );
  }
}