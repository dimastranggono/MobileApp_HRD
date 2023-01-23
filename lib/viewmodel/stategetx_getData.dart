import 'package:dio/dio.dart';
import 'package:get/get.dart';

class getData extends GetxController{
  var _dio = Dio();

  Map<String,dynamic> dataUser;

  Future <Map<String,dynamic>> getDataUserList() async{
     await Future.delayed(Duration(seconds: 3));
    var result = await _dio.get('https://reqres.in/api/users?page=2');
    dataUser = result.data;
    print(dataUser.length);
    update();
  }
}