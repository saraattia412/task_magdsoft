import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_magdsoft/business_logic/global_cubit/global_cubit.dart';

import '../../../components/view_design.dart';

class ViewAcer extends StatelessWidget {
  const ViewAcer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            childAspectRatio: 1 / 1.6, //width/height
            children: List.generate(
                GlobalCubit.get(context).acerProduct.length,
                    (index) => homeDesign(
                    GlobalCubit.get(context).acerProduct[index], context)),

          );
        },

    );
  }
}
