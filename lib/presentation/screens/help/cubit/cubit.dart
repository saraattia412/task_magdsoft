// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/constants/end_points.dart';
import 'package:task_magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:task_magdsoft/data/models/help_model.dart';
import 'package:task_magdsoft/presentation/screens/help/cubit/states.dart';

class HelpCubit extends Cubit<HelpStates>{
  HelpCubit() : super(InitialHelpStates());


  static HelpCubit get(context) => BlocProvider.of(context);

  HelpModel? helpModel;

  void getHelpData(){
    emit(LoadingHelpStates());
    DioHelper.getData(
        url: help,
    ).then((value) {
          print(value.data);
          helpModel=HelpModel.fromJson(value.data);
          print(helpModel!.message);
          print(helpModel!.help);
          emit(SuccessHelpStates(helpModel: helpModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorHelpStates(error: helpModel!.message));
    });
  }


  int? helpId;
  IconData icon=Icons.keyboard_arrow_down;
  bool isShow=true;

   changeVisibility({
    required int id ,
}){
     isShow = !isShow;
     helpId=id;
     icon=isShow ? Icons.keyboard_arrow_down  : Icons.keyboard_arrow_up;
     emit(ChangeState());

  }
}