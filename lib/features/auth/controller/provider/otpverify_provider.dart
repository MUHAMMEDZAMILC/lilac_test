import 'package:flutter/widgets.dart';
import 'package:lilac_test/data/api/urls.dart';

import '../../../../data/model/japx_model.dart';
import '../../../../data/service/apiservice.dart';

class OtpverifyProvider extends ChangeNotifier {
  
  bool btnverifyloading=false;

  verifyotpfn(BuildContext context,String number,int otp) async{
   
    try {
      btnverifyloading = true;
      notifyListeners();
      JapxModel body = JapxModel();
      body.data= Data(type: 'registration_otp_codes',attributes: {"phone":number,"otp":otp});
      var res = await Api.call(context, endPoint: verifyotpUrl, method: Method.post,body: body.toJson());
      return res;
    } catch (e) {
      return {'status':false,'message':'Something went wrong!'};
    }finally{
      btnverifyloading = false;
      notifyListeners();
    }
  }
}