// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_magdsoft/components/default_button.dart';
import 'package:task_magdsoft/presentation/screens/help/cubit/cubit.dart';
import 'package:task_magdsoft/presentation/screens/help/cubit/states.dart';
import 'package:task_magdsoft/presentation/styles/colors.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HelpCubit()..getHelpData(),
      child: BlocConsumer<HelpCubit, HelpStates>(
        listener: (BuildContext context, state) {
          if (state is SuccessHelpStates) {
            if (state.helpModel.help != null) {
              print(state.helpModel.message!);
            } else {
              print(state.helpModel.message);
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return Stack(
            children: [
              background(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Help',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition:
                          HelpCubit.get(context).helpModel?.message != null,
                      builder: (context) => ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildItem(
                                HelpCubit.get(context).helpModel!.help![index],
                                context,
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                                width: 20,
                              ),
                          itemCount:
                              HelpCubit.get(context).helpModel!.help!.length),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: defaultButton(
                          function: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          text: 'continue',
                          isUpperCase: false,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildItem(model, context, ) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: HexColor('#f2f2f2'), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 10,
                      start: 10,
                    ),
                    child: Text(
                      '${model.question}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        HelpCubit.get(context).changeVisibility(id: model.id);
                      },
                      child: Icon(HelpCubit.get(context).icon)),
                ],
              ),
              if (HelpCubit.get(context).isShow == false && HelpCubit.get(context).helpId==model.id)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${model.answer}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        decoration: TextDecoration.none),
                  ),
                )
            ],
          ),
        ),
      );
}
