// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/components/default_button.dart';
import 'package:task_magdsoft/components/verify_design.dart';
import 'package:task_magdsoft/data/network/requests/login_request.dart';
import 'package:task_magdsoft/data/network/responses/login_response.dart';
import 'package:task_magdsoft/presentation/screens/help/help_screen.dart';
import 'package:task_magdsoft/presentation/screens/verify/cubit/cubit.dart';
import 'package:task_magdsoft/presentation/screens/verify/cubit/states.dart';
import 'package:task_magdsoft/presentation/styles/colors.dart';

import '../../../components/toast_package.dart';
import '../../../constants/constants.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  var code1Controller = TextEditingController();
  var code2Controller = TextEditingController();
  var code3Controller = TextEditingController();
  var code4Controller = TextEditingController();


   RequestModel? requestModel;
   ResponsesModel? responsesModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OtpCubit(),
      child: BlocConsumer<OtpCubit,OtpStates>(
        listener: (BuildContext context, state) {
          if(state is SuccessOtpStates){

            //open home screen directly
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpScreen(),),
                  ( Route<dynamic> route )=> false,//اقفلها
            );

            showToast( //API messages by Toast
              text: 'verify done',
              state: ToastStates.SUCCESS,
            );
          }else if (state is ErrorOtpStates){
            showToast( //API messages by Toast
              text: 'error code please check it',
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(

              body: Stack(
                children: [
                  background(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 15
                            ),
                            child: const Center(
                              child: Text(
                                'Verify Phone',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: MediaQuery.of(context).size.height / 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  verifyDesign(context,code1Controller),
                                  verifyDesign(context,code2Controller),
                                  verifyDesign(context,code3Controller),
                                  verifyDesign(context,code4Controller),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextButton(onPressed: (){
                              showToast( //API messages by Toast
                                text: 'verify code is : 6523',
                                state: ToastStates.WARNING,
                              );
                            }, child: const Text(
                              'Resend code',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15
                              ),
                            )),
                          ),
                          ConditionalBuilder(
                              condition: state is! LoadingOtpStates,
                              builder: (context) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 100,
                                ),
                                child: defaultButton(function: (){
                                  OtpCubit.get(context).verifyCode(
                                    code: code1Controller.text+code2Controller.text
                                        +code3Controller.text+code4Controller.text,
                                    phone: phone! ,
                                  );
                                },
                                    text: 'Verify',
                                    isUpperCase: false
                                ),
                              ),
                              fallback: (context) =>
                              const Center(child: CircularProgressIndicator()))
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
