
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class stateLogin extends GetxController{
  var _dio = Dio();

  String email;
  String  password;
  bool iconPassword = true;


  void changePasswordSeen(){
    iconPassword = !iconPassword;
    update();
  }

  void inputUsernameLogin(String eml){
      email = eml;
      update();
  }

  void inputPasswordLogin( String pass){
      password = pass;
      update();
  }

  Future LoginUser({String emil,String pasword})  async{
     var result = await _dio.post('https://reqres.in/api/login',data: {
      'username' : email,
      'password' : password
    });
    update();
    return result;
  }
}