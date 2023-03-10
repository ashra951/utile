import 'package:dio/dio.dart';


class Dio_helping{
  static Dio ?dio;
  static inital(){
    dio=Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
            headers: {
              'lang':'er'git commit -m "Initial commit"
              'Content-Type':'application/json'
            }
        )
    );
  }
  static Future<Response> post_dio({
    required String path,
    required Map<String,dynamic>datas
  })async{
    return await dio!.post(path,
        data: datas
    );
  }

}