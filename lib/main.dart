// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/bloc_observer.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'constants/constants.dart';
import 'data/data_providers/local/cache_helper.dart';
import 'data/data_providers/remote/dio_helper.dart';
import 'presentation/router/app_router.dart';
import 'package:flutter_translate/flutter_translate.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  //بيتاكد ان كل حاجه ف الميثود هنا خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized(); //import use with async
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  phone = CacheHelper.getDataFromSharedPreference(key: 'phone');
  print('phone is $phone');

  final locale =
      CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(Locale(locale));

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GlobalCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(
          fontFamily: 'cairo',
          //scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              //statusBarColor: AppColors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
      ),
    );
  }
}
