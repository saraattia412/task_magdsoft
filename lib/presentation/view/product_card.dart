// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task_magdsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:task_magdsoft/components/form_field.dart';
import '../screens/bottom_design/bottom_nav_design.dart';

import '../styles/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: Stack(
            children: [
              background(),
              ConditionalBuilder(
                  condition:
                      GlobalCubit.get(context).homeModel?.products != null,
                  builder: (context) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, bottom: 30),
                                    child: SizedBox(
                                      width: 300,
                                      child: defaultFormField(
                                        controller: searchController,
                                        type: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'What do you want to search for ?';
                                          }
                                          return null;
                                        },
                                        label: 'search',
                                        suffix: Icons.search,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Image.asset(
                                        'assets/images/searchlight_icon.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, end: 20),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/images/home.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 30, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'New Release',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Text(
                                        'Acer Predator Helios 300',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    deignTab('All', 'assets/images/cup.png',0,context),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    deignTab('Acer', 'assets/images/acer.png',1,context),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    deignTab('Razer', 'assets/images/razer.png',2,context),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    deignTab('Apple', 'assets/images/apple.png',3,context),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: 20,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Recomended \n for You',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ),
                            ),

                            GlobalCubit.get(context).data[GlobalCubit.get(context).currentIndex]
                          ],
                        ),
                      ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()))
            ],
          ),
          floatingActionButton: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavDesign(),//design layout
        );
      },
    );
  }


  Widget deignTab(
    text,
    pathImage,
      int index,
      context
  ) =>
      InkWell(
        onTap: (){
          GlobalCubit.get(context).changeView(index);
        },
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: index==GlobalCubit.get(context).currentIndex ? Colors.blue:Colors.white,
            border: Border.all(color: HexColor('#f2f2f2'), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor('#f2f2f2'), width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipOval(
                      child: Image.asset(
                    pathImage,
                    height: 50,
                    width: 50,
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

}
