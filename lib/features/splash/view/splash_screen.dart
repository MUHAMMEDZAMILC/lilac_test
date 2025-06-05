import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/app_dimensions.dart';
import 'package:lilac_test/core/contants/assets_path.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/helper/help_screensize.dart';
import 'package:lilac_test/core/helper/helper_pagenavigator.dart';
import 'package:lilac_test/core/theme/app_colors.dart';
import 'package:lilac_test/features/auth/view/login_withphone_screen.dart';
import 'package:lilac_test/shared/widgets/appbutton.dart';
import 'package:lilac_test/shared/widgets/appsvg.dart';
import 'package:lilac_test/shared/widgets/apptext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: ScreenUtils.screenWidth,
              height: ScreenUtils.screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetPaths.loginbg),fit: BoxFit.cover)
              ),
            ),
            Container(
              width: ScreenUtils.screenWidth,
              height: ScreenUtils.screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [AppColors.blackcolor.withOpacity(0),AppColors.blackcolor.withOpacity(0)])
              ),
            ),
            SizedBox(
              width: ScreenUtils.screenWidth,
              height: ScreenUtils.screenHeight,
              child: Padding(
                padding:  EdgeInsets.all(25.h),
                child: Column(
                  children: [
                   110.hBox,
                    Image.asset(AssetPaths.logo,width: 50.w,height: 50.h,),
                    6.hBox,
                    AppText(text: 'Connect. Meet. Love.\nWith Fliq Dating',color: AppColors.white,weight: FontWeight.w700,size: 32.sp,maxline: 2,textalign: TextAlign.center,)
                    ,Spacer(),
                    AppButton(
                      width: 380.w,
                      buttonStyle: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors.white),
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.r),
                        ))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSvg(assetName: AssetPaths.googleicon),
                          4.wBox,
                          AppText(text: 'Sign in with Google',weight: FontWeight.w500,size: 14,)
                        ],
                      ),
                      onPressed: () {
                      
                    }, isValid: true),
                    AppDimensions.gapLarge,
                    AppButton(
                      width: 380.w,
                      buttonStyle: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors.facebookblue),
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.r),
                        ))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSvg(assetName: AssetPaths.facebookicon),
                          4.wBox,
                          AppText(text: 'Sign in with Facebook',weight: FontWeight.w500,size: 14,color: AppColors.white,)
                        ],
                      ),
                      onPressed: () {
                      
                    }, isValid: true),
                    AppDimensions.gapLarge,
                    AppButton(
                      width: 380.w,
                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSvg(assetName: AssetPaths.callicon),
                          4.wBox,
                          AppText(text: 'Sign in with phone number',weight: FontWeight.w500,size: 14,color: AppColors.white,)
                        ],
                      ),
                      onPressed: () {
                      Screen.open(context, LoginwithnumberScreen());
                    }, isValid: true),
                    AppDimensions.gap24,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                      TextSpan(text: 'By signing up, you agree to our ',style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      )),
                      TextSpan(text: 'Terms. ',style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white
                      )),
                      TextSpan(text: 'See how we use your data in our ',style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      )),
                      TextSpan(text: 'Privacy Policy.',style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white
                      )),
                    ],))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}