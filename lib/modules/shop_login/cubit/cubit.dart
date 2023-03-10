import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/modules/shop_login/cubit/states.dart';
import 'package:untitled9/shared/Network/remote/dio_helper.dart';

import '../../../shared/Network/end_points/end_point.dart';

class shop_logincub extends Cubit<states_shoplogin> {
  shop_logincub() :super(intiail_shoplogin());

  static shop_logincub get(context) => BlocProvider.of(context);

  void user_login({
    required String emil,
    required String passwprd
  }) {
    emit(loading_shoplogin());
    Dio_helping.post_dio(path: Login, datas: {
      'email': emil,
      'password': passwprd
    }).then((value) {
      print(value);
    }).catchError((e) {
      print(e.toString());
    });
  }
}
