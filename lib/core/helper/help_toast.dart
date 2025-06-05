
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_colors.dart';


enum MessageType { error, success, warning }

 snackBar(BuildContext context,
    {required String message,
    MessageType type = MessageType.error,
    Color? kcolor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: AppColors.white,
        fontSize: 12.0
    );
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     backgroundColor:  kcolor ?? _getColor(type),
  //     duration: Duration(seconds: 2),
  //     content: AppText(
  //         size: 12,
  //         text: message.toUpperCase(),
  //         color: Colors.white,
  //         maxline: 2,)));
}