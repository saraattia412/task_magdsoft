// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_magdsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:task_magdsoft/components/line.dart';
import 'package:task_magdsoft/presentation/styles/colors.dart';

import '../../../components/default_button.dart';

class ShowProduct extends StatelessWidget {
  final model;
   ShowProduct({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: Stack(
            children: [
              background(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.grey,
                          ),),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        model.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Type : ${model.type}',
                        style: const TextStyle(
                            fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 300,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: HexColor('#f2f2f2'),
                            width: 2,
                          ),
                        ),
                        child: Image.network(model.image),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              design(model),
                              const SizedBox(width: 20,),
                              design(model),
                              const SizedBox(width: 20,),
                              design(model),
                              const SizedBox(width: 20,),
                              design(model),
                              ]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'price',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  '${model.price} EGP',
                                  style: const TextStyle(
                                      fontSize: 20,  color: Colors.black),
                                ),

                              ],
                            ),
                            defaultButton(
                                function: (){},
                                text: 'Add To Cart',
                                isUpperCase: false,
                                width: 150
                            ),
                          ],
                        ),
                      ),
                      myDivider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model.description,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },

    );
  }

  Widget design(model) => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: HexColor('#f2f2f2'),
        width: 2,
      ),
    ),
    child: Image.network(model.image),
  );




}
