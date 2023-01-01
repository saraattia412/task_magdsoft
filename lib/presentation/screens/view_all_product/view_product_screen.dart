import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/business_logic/global_cubit/global_cubit.dart';

import '../../../components/view_design.dart';

class ViewAllProducts extends StatelessWidget {
  const ViewAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return  GridView.count(//show data
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.6, //width/height
              children: List.generate(
                  GlobalCubit.get(context).homeModel!.products!.length,
                      (index) => homeDesign(
                      GlobalCubit.get(context).homeModel!.products![index], context),),

          );
        },
        );
  }


}
