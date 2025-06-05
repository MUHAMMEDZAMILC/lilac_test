// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/app_dimensions.dart';
import 'package:lilac_test/core/contants/assets_path.dart';
import 'package:lilac_test/core/extension/space_ext.dart';
import 'package:lilac_test/shared/widgets/appsvg.dart';
import '../../core/helper/helper_pagenavigator.dart';
import '../../core/theme/app_colors.dart';
import 'apptext.dart';

class AppBarMn extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  bool? titleonly = true, isback = false;
  String? titlename;
  Widget? leading;
  List<Widget>? actions;
  Color? bgcolor;
  double? height;
  double? toolbarHeight;
  PreferredSizeWidget? bottom;
  AppBarMn(
      {super.key,
      this.titlename,
      this.bgcolor,
      this.title,
      this.titleonly,
      this.toolbarHeight,
      this.leading,
      this.actions,
      this.height,
      this.bottom,
      this.isback});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
        toolbarHeight: toolbarHeight,
        shadowColor: AppColors.transparent,
        backgroundColor:bgcolor?? AppColors.white,

        elevation: 0,
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            color: bgcolor??AppColors.white
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
               
                children: [
                  25.wBox,
                  isback == true
                ? InkWell(
                    splashFactory: NoSplash.splashFactory,
                    highlightColor: Colors.transparent,
                    hoverColor: const Color.fromARGB(0, 79, 43, 43),
                    splashColor: Colors.transparent,
                    onTap: () {
                      Screen.close(context);
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
                  )
                : 0.hBox,
                AppDimensions.gapHorizontalLarge,
                 titleonly != true
                ? title?? AppText(
                    text: titlename ?? '',
                    size: 22.h,
                    letterspace: 0.4,
                    weight: FontWeight.w600,
                  )
                : 0.hBox,
                ],
              ),
              19.hBox
            ],
          ),
        ),
        centerTitle: false,
        title: titleonly == true
            ? title?? AppText(
      text: titlename ?? '',
      size: 22.h,
      letterspace: 0.4,
      weight: FontWeight.w600,
    )
            : 0.hBox,
            leadingWidth: 36.w,

       automaticallyImplyLeading: isback==true?false:true,
        actions: actions,
        bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 118.h);
}

class ApBarMnHmSc extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading;
  Widget? titlewidget;
  List<Widget>? actions;
  ApBarMnHmSc(
      {super.key, this.title, this.leading, this.actions, this.titlewidget});
  @override
  Widget build(BuildContext context) {
    return AppBar(
       shadowColor: AppColors.transparent,
        titleSpacing: 10,
        elevation: 0,
        title: titlewidget ?? Text(title ?? ''),
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize =>  Size.fromHeight(1130.h);
}
