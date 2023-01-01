// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/constants/end_points.dart';
import 'package:task_magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:task_magdsoft/data/models/account_model.dart';
import 'package:task_magdsoft/presentation/screens/Apple_product/Apple_product_screen.dart';
import 'package:task_magdsoft/presentation/screens/Razer_product/Razer_product_screen.dart';
import 'package:task_magdsoft/presentation/screens/Screen_1_/screen.dart';
import 'package:task_magdsoft/presentation/screens/fav/fav_screen.dart';
import 'package:task_magdsoft/presentation/screens/navigation/navigatin_screen.dart';
import 'package:task_magdsoft/presentation/screens/settings/setting_screen.dart';
import 'package:task_magdsoft/presentation/screens/view_acer_product/view_acer_screen.dart';
import 'package:task_magdsoft/presentation/screens/view_all_product/view_product_screen.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitialStates());

  static GlobalCubit get(context) => BlocProvider.of(context);

  List<Products> acerProduct=[];
  List<Products> razerProduct=[];
  List<Products> appleProduct=[];

  List data =[
    const ViewAllProducts(),
    const ViewAcer(),
    const RazerProduct(),
    const AppleProduct(),
  ];

  List screens =[//for bottom nav bar items
    const Screen(),
    const FavoritesScreen(),
    const NavigationScreen(),
    const SettingsScreen(),
  ];

  int currentIndex=0;

  void changeView(int index){
    currentIndex = index;
    emit(ChangeViewGlobalStates());
  }


  HomeModel? homeModel;
//get product card
  void getHomeData(){
    emit(LoadingGlobalStates());
    DioHelper.getData(url: home).then((value) {
      print(value.data);
      homeModel=HomeModel.fromJson(value.data);

      homeModel!.products!.forEach((element) {
        if(element.company == 'Acer'){
          acerProduct.add(element);
        }else if(element.company == 'Razer'){
          razerProduct.add(element);
        }else if(element.company == 'Apple'){
          appleProduct.add(element);
        }
      });
      emit(SuccessGlobalStates(homeModel: homeModel!));
    }).catchError((error){
      print(error.toString());
      emit(ErrorGlobalStates(error: homeModel!.message));
    });
  }



}
