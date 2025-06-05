import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/contants/app_dimensions.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/helper/help_screensize.dart';
import 'package:lilac_test/core/helper/help_toast.dart';
import 'package:lilac_test/features/auth/controller/provider/otpverify_provider.dart';
import 'package:lilac_test/features/home/view/home_screen.dart';
import 'package:lilac_test/shared/widgets/apprichtext.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../core/helper/helper_pagenavigator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/appbutton.dart';
import '../../../shared/widgets/apptext.dart';

class OtpverifyScreen extends StatefulWidget {
   OtpverifyScreen({super.key,required this.number});
String number;
  @override
  State<OtpverifyScreen> createState() => _OtpverifyScreenState();
}

class _OtpverifyScreenState extends State<OtpverifyScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController otpCtrl = TextEditingController();
  int remainingSeconds = 60;
  bool canResend = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
     final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

String? _validateotp(String? value) {
    if (value == null || value.trim().isEmpty || value.length<6) {
      return 'otp is must 6 digit';
    }
  
    return null;
  }
  @override
  void dispose() {
    _animationController.dispose();
    otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMn(isback: true),
      body: SizedBox(
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        child: Padding(
          padding: EdgeInsets.all(25.h),
          child: Column(
            children: [
              AppText(
                text: 'Enter your verification\ncode',
                weight: FontWeight.w600,
                size: 28.sp,
                textalign: TextAlign.center,
                overrideStyle: GoogleFonts.jost(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                ),
                maxline: 2,
              ),
              32.hBox,
              Row(
                children: [
                  AppRichText(
                    normalText: '+91 98745 61230. ',
                    richText: 'Edit',
                    normalFontWeight: FontWeight.w400,
                    richFontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    richTextFontSize: 14.sp,
                  ),
                ],
              ),
              AppDimensions.gapLarge,
              Form(
                key: _formKey,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Pinput(

                    onChanged: (value) {
                      setState(() {});
                    },
                    hapticFeedbackType: HapticFeedbackType.mediumImpact,
                    length: 6,
                    autofocus: false,
                    controller: otpCtrl,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    validator: _validateotp,
                    errorTextStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.error
                    ),
                    defaultPinTheme: PinTheme(
                      width: 56.h,
                      height: 56.h,
                      textStyle: GoogleFonts.poppins(
                        color: AppColors.textcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.46),
                        border: Border.all(color: AppColors.textfeildborder),
                      ),
                    ),
                  ),
                ),
              ),
              AppDimensions.gap24,
              Row(
                children: [
                  Flexible(
                    child: AppRichText(
                      
                      normalText:
                          'Didn’t get anything? No worries, let’s try again. ',
                      richText: 'Resent',
                      normalFontWeight: FontWeight.w400,
                      richFontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      richTextFontSize: 14.sp,
                      richTextColor: Color(0xFF4A90E2),
                    ),
                  ),
                ],
              ),
              Spacer(),
               AppButtonGradient(
                isLoading: context.watch<OtpverifyProvider>().btnverifyloading,
                onPressed: () async{
                  if (_formKey.currentState?.validate() ?? false) {
                     var res = await context.read<OtpverifyProvider>().verifyotpfn(context, widget.number, int.parse(otpCtrl.text));
                     if (res['status']==true) {
                       Screen.openAsNewPage(context, HomeScreen());
                     }else{
                      snackBar(context, message: 'Invalid Otp');
                     }
                    } 
                // Screen.openAsNewPage(context, HomeScreen());
              }, isValid: true,btntxt: 'Verify',)
            ],
          ),
        ),
      ),
    );
  }
}
