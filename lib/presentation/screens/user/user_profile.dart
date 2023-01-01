// ignore_for_file: must_be_immutable, avoid_print, unnecessary_null_comparison

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_magdsoft/presentation/screens/user/cubit/cubit.dart';
import '../../../components/default_button.dart';
import '../../../components/form_field.dart';
import '../../../components/line.dart';
import '../../../components/toast_package.dart';
import '../../../constants/constants.dart';
import '../help/help_screen.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


   var formKey =GlobalKey<FormState>();
   var nameController =TextEditingController();
  var phoneController = TextEditingController();

   bool isLogin = false;
   Map userInfo={};


  @override
  Widget build(BuildContext context) {

    
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LogInStates>(
        listener: (BuildContext context, state) {

          if (state is SuccessLogInRequestStates) {
            print(state.requestModel.phone);
            phone = phoneController.text;
          }

          if(state is SuccessLogInStates) {
            if(state.responsesModel.message != null){
              Navigator.pushNamed(context, '/verify');
              showToast( //API messages by Toast
                  text: state.responsesModel.message!,
                  state: ToastStates.SUCCESS,);
            }
            else {
              showToast( //API messages by Toast
                text: state.responsesModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }



        },
        builder: (BuildContext context, Object? state) {

         return Scaffold(
            body:  Stack(
              children:  [
                //display the images from assets
                const Image(image: AssetImage('assets/images/background_login.png')),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height:500 ,
                    decoration:  const BoxDecoration(

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(child: myDivider()),
                              const Text(
                                'OR',
                                style: TextStyle(
                                    color: Colors.blue
                                ),
                              ),
                              Expanded(child: myDivider()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 40
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              iconsDesign(context,'assets/images/facebook.png',),
                              iconsDesign(context,'assets/images/apple.png',),
                              iconsDesign(context,'assets/images/google.png',),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: EdgeInsetsDirectional.all(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children:  [
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              myDivider(),
                              const SizedBox(height: 20,),
                              defaultFormField(
                                controller: nameController,
                                type: TextInputType.text,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'please your name must not be null';
                                  }
                                  return null;
                                },
                                label: 'Enter Your Full Name',
                              ),
                              const SizedBox(height: 20,),
                              defaultFormField(
                                controller: phoneController,
                                type: TextInputType.phone,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'please your phone must not be null';
                                  }
                                  return null;
                                },
                                label: 'Enter Your Phone Number',
                              ),
                              const SizedBox(height: 30,),
                              ConditionalBuilder(
                                condition: state is! LoadingLogInRequestStates,
                                builder: (BuildContext context) => defaultButton(
                                  function: (){
                                    if(formKey.currentState!.validate()){//show text validation

                                      LoginCubit.get(context).requestLogin(
                                          name: nameController.text,
                                          phone: phoneController.text);
                                    }
                                  },
                                  text: 'Login',
                                  isUpperCase: false,
                                ),
                                fallback: (BuildContext context) =>
                                    const Center(child: CircularProgressIndicator())
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          );
        },

      ),
    );


  }
  
  
  Widget iconsDesign(context,path)=> Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 60,
      width: 60,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border:  Border.all(
          color: HexColor('#f2f2f2'),
          width: 1,
        ),
        color: Colors.white
      ),
      child: MaterialButton(
        onPressed: ()  {
          //open home screen directly
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpScreen(),),
                ( Route<dynamic> route )=> false,//اقفلها
          );
        },
        child:  ClipOval(
          child: ImageIcon(
            AssetImage(path),
            size: 50,
          ),
        ),
      ),
    ),
  );


}
