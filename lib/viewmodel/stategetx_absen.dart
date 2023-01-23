import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StateAbsen extends GetxController{
  var _dio = Dio();
  

  //variabel untuk parameter request body
  var responAbsen;
  String name;
  String job;

  void InputNamaUser(String namaUser){
    name = namaUser;
    update();
  }

  void InputJabatanUser(String jbtnUser){
    job = jbtnUser;
    update();
  }

  Future postAbsen ({String name,String job}) async{
    Future.delayed(Duration(seconds: 2));
    responAbsen = await _dio.post('https://reqres.in/api/users',
    // options: Options(headers:{"Authorization":"Bearer $token"},)
    data: {
      'name' : name,
      'job'  : job
    });

    update();
    return responAbsen;
  }

  //variabel untuk response data
  // String name,job,id,date;

  // StateAbsen({this.name,this.job,this.id,this.date});
  
  // Future<StateAbsen> postResponseAbse (String namaInput,String jobInput) async{
  //   responAbsen = await _dio.post('https://reqres.in/api/users'
  //     ,data: {
  //       'name' : name,
  //       'job' : job
  //     }
  //   );

  //   var reponseUrl = jsonDecode(responAbsen.body);
  //   return StateAbsen(
  //     id: reponseUrl["id"],
  //     name: reponseUrl["name"],
  //     job: reponseUrl["id"],
  //     date: reponseUrl["createdAt"]
  //   );
  // }

  
}