import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/core/theme/app_colors.dart';

import '../../../../shared/widgets/apptext.dart';


// ignore: must_be_immutable
class ReceivedMessage extends StatelessWidget {
  final String message;
  String? time;
  bool isSeen;
   ReceivedMessage({
    Key? key,
    required this.message,
    this.time='',
    this.isSeen=false
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final messageTextGroup = SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
      Flexible(
        child: Container(
         
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
              bottomRight: Radius.circular(8.r),
            ),
          ),
          child: Padding(
                   padding:  EdgeInsets.only( left: 25.w,top: 7.h,bottom: 7.h,right: 8.h),
                  child: AppText(
                  text:message,
                  maxline: 5,
                  color: AppColors.blackcolor,size: 14.sp,textalign: TextAlign.left,weight: FontWeight.w400,),
                ),
        ),
      ),
      Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(text: time??'',color: AppColors.primarytextlightcolor,weight: FontWeight.w400,size: 10.sp,),
              3.wBox,
              Icon(Icons.done_all,color:isSeen?AppColors.facebookblue: AppColors.primarytextlightcolor,size: 14.h,)
            ],
          )
        ],
      ),
    );

    return  messageTextGroup;
  }
}

class Triangle {
}