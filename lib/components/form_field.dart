// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType type,
  Function(String)? onSubmit,
  required FormFieldValidator<String>? validator,
  required String label,
  IconData? suffix,
  Function? suffixPressed,


  //part password

  //on tap
  Function? onTap,
  bool isClickable = true,

}) =>
    Card(
      elevation: 5,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          onFieldSubmitted: onSubmit,
          controller: controller,
          keyboardType: type,
          validator: validator,



          decoration: InputDecoration(
            suffixIcon :suffix != null ?  IconButton(
              onPressed: (){
                suffixPressed!();
              },
              icon: Icon(
                suffix,
              ),
            ) : null,

            hintText: label,
             border: InputBorder.none,
            fillColor: Colors.white,

          ),
          //on tap
          onTap: () {
            print('done');
          },
//END ON TAP
          enabled: isClickable,
        ),
      ),
    );
