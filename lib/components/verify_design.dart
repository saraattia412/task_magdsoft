// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget verifyDesign(context,controller) => Container(
    height: 80,
    width: 60,
    decoration:  BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.white,
        ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.headlineLarge,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration:   InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color:Colors.white,
            width: 2.0,
          ),
        ),


      ),
      onChanged: (value){
        if(value.length == 1){
          FocusScope.of(context).nextFocus();
        }
      },
    )
);