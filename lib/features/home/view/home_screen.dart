// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/app_dimensions.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/helper/help_screensize.dart';
import 'package:lilac_test/core/helper/helper_pagenavigator.dart';
import 'package:lilac_test/features/chat/view/chat_screen.dart';
import 'package:lilac_test/shared/widgets/appbar.dart';
import 'package:lilac_test/shared/widgets/apptext.dart';
import 'package:lilac_test/shared/widgets/apptextfeild.dart';

import '../../../core/contants/assets_path.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/appsvg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMn(
        height: 74.h,
        isback: true,
        leading:GestureDetector(
          onTap: () {
            exit(0);
          },
          child: Container(
          width: 36.w,
          height: 36.h,
          
          decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle  ,
          boxShadow: [
            BoxShadow(color: AppColors.blackcolor.withOpacity(0.05),blurRadius: 13.r)
          ]
          ),
          child:Center(child: AppSvg(assetName: AssetPaths.leftarrowicon,height: 24.h,width: 24.w,))
                ),
        ), 
        titlename: 'Messages',

      ),
      body: SizedBox(
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        child: Column(

          children: [
            AppDimensions.gap24,
            Padding(
              padding: EdgeInsets.only(left:  25.w),
              child: SizedBox(
                width: ScreenUtils.screenWidth,
                height: 85.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  return  Padding(
                    padding:  EdgeInsets.only(right:  24.w),
                    child: Column(
                                  
                      children: [
                        CircleAvatar(radius: 30.r,),
                        4.hBox,
                        AppText(text: 'Patricia',weight: FontWeight.w300,size: 14.sp)
                      ],
                    ),
                  );
                },),
              ),
            ),
            34.hBox,
            Expanded(
              child: SizedBox(
                width: ScreenUtils.screenWidth,
                child: Padding(
                  padding:  EdgeInsets.all(25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(controller: searchCtrl,suffix: AppSvg(assetName: AssetPaths.searchfavouriteicon),borderstyle: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textfeildborder,
                        
                        ),
                        borderRadius: BorderRadius.circular(98.r)
                      ),hinttext: 'Search',),
                      AppDimensions.gapLarge,
            AppText(text: 'Chat',weight: FontWeight.w600,size: 14.sp,),
            AppDimensions.gapLarge,
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Screen.open(context, ChatScreen());
                  },
                  child: Row(
                    children: [
                       CircleAvatar(radius: 30.r,),
                       12.wBox,
                       AppText(text: 'Regina Bearden',weight: FontWeight.w600,size: 18.sp,),
                       Spacer(),
                       AppText(text: '10:00 AM',weight: FontWeight.w400,size: 12.sp,color: AppColors.primarytextlightcolor,)
                    ],
                  ),
                );
              }, separatorBuilder: (context, index) => Divider(color: Color(0xFFF5F5F5),thickness: 0.5.h,), itemCount: 8),
            )
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}