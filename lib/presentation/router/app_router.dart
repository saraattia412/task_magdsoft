import 'package:flutter/material.dart';
import 'package:task_magdsoft/presentation/screens/help/help_screen.dart';
import 'package:task_magdsoft/presentation/screens/show_product/show_product_screen.dart';
import 'package:task_magdsoft/presentation/screens/verify/verify_screen.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/user_profile.dart';
import '../view/product_card.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) =>  LoginScreen());
      case '/verify':
        return MaterialPageRoute(builder: (context) =>   VerifyScreen());
      case '/help':
        return MaterialPageRoute(builder: (context) =>   const HelpScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) =>   HomeScreen());
      case '/show':
        return MaterialPageRoute(builder: (context) =>   ShowProduct());
      default:
        return null;
    }
  }
}