import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/contants/assets_path.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/helper/help_screensize.dart';
import 'package:lilac_test/core/helper/helper_pagenavigator.dart';
import 'package:lilac_test/core/theme/app_colors.dart';
import 'package:lilac_test/core/theme/app_dimensions.dart';
import 'package:lilac_test/features/auth/controller/provider/loginnumber_provider.dart';
import 'package:lilac_test/features/auth/view/otpverify_screen.dart';
import 'package:lilac_test/shared/widgets/appbar.dart';
import 'package:lilac_test/shared/widgets/appbutton.dart';
import 'package:lilac_test/shared/widgets/appsvg.dart';
import 'package:lilac_test/shared/widgets/apptext.dart';
import 'package:lilac_test/shared/widgets/apptextfeild.dart';
import 'package:provider/provider.dart';

class LoginwithnumberScreen extends StatefulWidget {
  const LoginwithnumberScreen({super.key});

  @override
  State<LoginwithnumberScreen> createState() => _LoginwithnumberScreenState();
}

class _LoginwithnumberScreenState extends State<LoginwithnumberScreen> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController numberCtrl = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
  else  if (!RegExp(r'^\d{10}?$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      
      child: Scaffold(
        appBar: AppBarMn(isback: true),
        body: SizedBox(
          width: ScreenUtils.screenWidth,
          height: ScreenUtils.screenHeight,
          child: Padding(
            padding: EdgeInsets.all(25.h),
            child: Column(
              children: [
              
                AppText(
                  text: 'Enter your phone\nnumber',
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
                Form(
                  key: _formKey,
                  autovalidateMode: _autovalidateMode,
                  child: AppTextField(
                     inputFormater: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onvalidate: _validatePhone,
                  maxLength: 10,
                  onChanged: (value) {
                   if( numberCtrl.text.length <= 1){
                     setState(() {

                     });
                   }
                  },
                    controller: numberCtrl,
                    prefix: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 91.w,
                            height: 24.h,
                            child: Row(
                              children: [
                                AppSvg(assetName: AssetPaths.phoneicon),
                        
                                AppText(text: '+91', weight: FontWeight.w400),
                        
                                AppSvg(assetName: AssetPaths.dropdownicon),
                              ],
                            ),
                          ),
                          AppDimensions.gapLarge,
                          Container(
                            height: 17.h,
                            width: 1.h,
                            color: Color(0xFFD5CFD0),
                          ),
                        ],
                      ),
                    ),
                    type: TextInputType.number,
                  ),
                ),
                AppDimensions.gap,
                Row(
                  children: [
                    AppText(text: 'Fliq will send you a text with a verification code.',color: AppColors.primarytextlightcolor,weight: FontWeight.w400,size: 14.sp,),
                  ],
                ),
                Spacer(),
                AppButtonGradient(
                  isLoading: context.watch<LoginwithnumberProvider>().btnloginloading,
                  onPressed: () async{
                  if (_formKey.currentState?.validate() ?? false) {
                    var res =  await context.read<LoginwithnumberProvider>().loginwithnumber(context, '+91${numberCtrl.text.trim()}');
                    if (res['status']) {
                      Screen.open(context, OtpverifyScreen(number:'+91${numberCtrl.text.trim()}' ,));
                    }
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.onUserInteraction;
                      });
                    }
                }, isValid: true,btntxt: 'Next',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
