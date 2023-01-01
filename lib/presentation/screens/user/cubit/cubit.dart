// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/data/data_providers/local/cache_helper.dart';
import 'package:task_magdsoft/presentation/screens/user/cubit/states.dart';

import '../../../../constants/end_points.dart';
import '../../../../data/data_providers/remote/dio_helper.dart';
import '../../../../data/network/requests/login_request.dart';
import '../../../../data/network/responses/login_response.dart';


class LoginCubit extends Cubit<LogInStates>{
  LoginCubit() : super(InitialLogInStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  ResponsesModel? responsesModel;
  RequestModel? requestModel;


  void requestLogin({
    required String name,
    required String phone,
  }){
    emit(LoadingLogInRequestStates());
    requestModel=RequestModel(name: name, phone: phone);
    CacheHelper.saveDataSharedPreference(//save phone number
        key: 'phone', value: requestModel!.phone)
        .then((value){
          CacheHelper.saveDataSharedPreference(key: 'name', value: requestModel!.name);
          print('USER DATA :  ${requestModel!.name} , ${requestModel!.phone}');
          userLogin(name: requestModel!.name!, phone: requestModel!.phone!);
          emit(LoadingLogInRequestStates());
    }).catchError((error){
      print(error.toString());
      emit(ErrorLogInRequestStates(error.toString()));
    });

  }


  void userLogin({
    required String name,
    required String phone,
  }){
    emit(LoadingLogInStates());
    DioHelper.postData(
        url: verify,
        body: {
          'name' : name,
          'phone' : phone,
        }
    ).then((value)  {
      print(value.data);
      responsesModel=ResponsesModel.fromJson(value.data);
      emit(SuccessLogInStates( responsesModel: responsesModel!));
    }).catchError((error){
      print(error.toString());
      emit(ErrorLogInStates(responsesModel!.message));
    });
  }







}