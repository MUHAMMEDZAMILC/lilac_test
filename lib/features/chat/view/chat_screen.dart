import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/app_dimensions.dart';
import 'package:lilac_test/core/contants/assets_path.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/helper/help_screensize.dart';
import 'package:lilac_test/core/theme/app_colors.dart';
import 'package:lilac_test/shared/widgets/appbar.dart';
import 'package:lilac_test/shared/widgets/appsvg.dart';
import 'package:lilac_test/shared/widgets/apptext.dart';
import 'package:lilac_test/shared/widgets/apptextfeild.dart';

import 'widget/sendbubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messagesCtrl = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBarMn(
        bgcolor: Color(0xFFF5F5F5),
        isback: true,
        height: 74.h,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=0')
            ),
            AppDimensions.gapHorizontal,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: 'Regina Bearden',weight: FontWeight.w600,size: 18.sp,),
                Row(
                  children: [
                    AppText(text: 'Online',size: 14.sp,weight: FontWeight.w300,color: AppColors.primarytextlightcolor,),
                    AppDimensions.gapHorizontalSmall,
                    CircleAvatar(radius: 6.r,backgroundColor: AppColors.onlinegreen,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
      body: Container( 
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r)

          ),
          boxShadow: [BoxShadow(color: AppColors.blackcolor.withOpacity(0.15),offset: Offset(0, 10.h),blurRadius: 46.r)]
        ),
        child: Column(
          children: [
            25.hBox,
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:  25.w),
                child: ListView.builder(
                              controller: _scrollController,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return SentMessage(
                                  message: 'Hi',
                                  time: '10:00 AM',
                                );
                              
                              }),
              ),
            ),
            AppDimensions.gap,
            Divider(color: AppColors.textfeildborder,),
            AppDimensions.gap,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  25.w),
              child: AppTextField(controller: messagesCtrl,filledcolor: Color(0xFFF5F5F5),borderstyle: OutlineInputBorder(
                borderRadius: BorderRadius.circular(81.r),
                borderSide: BorderSide.none
              ),suffix: AppSvg(assetName: AssetPaths.sendicon),hinttext: 'Enter Message',),
            ),
            25.hBox,
          ],
        ),
      ),
      
    );

  }
}