import 'package:flutter/material.dart';
import 'package:lilac_test/data/model/japx_model.dart';
import 'package:lilac_test/data/service/apiservice.dart';

import '../../../../data/api/urls.dart';

class LoginwithnumberProvider extends ChangeNotifier {
  
  bool btnloginloading = false;
  loginwithnumber(BuildContext context, String number) async{
    try {
      btnloginloading = true;
      notifyListeners();
      JapxModel body = JapxModel();
      body.data= Data(type: 'registration_otp_codes',attributes: {"phone":number});
      var res = await Api.call(context, endPoint: sendotpUrl, method: Method.post,body: body.toJson());
      return res;
    } catch (e) {
      return {'status':false,'message':'Something went wrong!'};
    }finally{
      btnloginloading = false;
      notifyListeners();
    }
  }
}