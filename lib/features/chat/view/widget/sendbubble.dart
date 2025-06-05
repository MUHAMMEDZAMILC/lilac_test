import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/extension/space_ext.dart';

import 'package:lilac_test/core/theme/app_colors.dart';

import '../../../../shared/widgets/apptext.dart';
// ignore: must_be_immutable
class SentMessage extends StatelessWidget {
  final String message;
  String? time;
  bool isSeen;
   SentMessage({
    Key? key,
    required this.message,
    this.time='',
    this.isSeen=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Column(
       mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
           
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.only( right: 25.w,top: 7.h,bottom: 7.h,left: 8.h),
              child: AppText(
              text:message,
              maxline: 5,
              color: AppColors.white,size: 14.sp,textalign: TextAlign.left,weight: FontWeight.w400,),
            ),
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(text: time??'',color: AppColors.primarytextlightcolor,weight: FontWeight.w400,size: 10.sp,),
              3.wBox,
              Icon(Icons.done_all,color:isSeen?AppColors.facebookblue: AppColors.primarytextlightcolor,size: 14.h,)
            ],
          )
      ],
    );

    return 
          Padding(
            padding:  EdgeInsets.symmetric(vertical:  4.h),
            child: messageTextGroup,
          );
  }
}