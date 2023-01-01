

// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:task_magdsoft/presentation/screens/verify/cubit/states.dart';

import '../../../../constants/end_points.dart';

class OtpCubit extends Cubit<OtpStates>{
  OtpCubit() : super(InitialOtpStates());

  static OtpCubit get(context) => BlocProvider.of(context);







  void verifyCode({
  required String code,
    required String phone,
}){
    emit(LoadingOtpStates());
    DioHelper.postData(
        url: otp,
        body: {
          'code' : code,
          'phone' : phone,
        }
    ).then((value) {
      print(value.data);
      emit(SuccessOtpStates());
    }).catchError((error){
      emit(ErrorOtpStates(error.toString()));
    });
  }
}