import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../presentation/screens/show_product/show_product_screen.dart';


Widget homeDesign(model, context) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: HexColor('#f2f2f2'), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                border: Border.all(color: HexColor('#f2f2f2'), width: 2),
              ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(model.image),
                  ),
                   const Icon(
                       Icons.favorite_border,
                     color: Colors.grey,
                   ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.company,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${model.price} EGP',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      )),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ShowProduct(model: model,),
                        )
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )))
            ],
          ),
        ],
      ),
    ),
  ),
);
