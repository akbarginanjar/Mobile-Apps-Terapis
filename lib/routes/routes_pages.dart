import 'package:get/get.dart';
import '../helpers/base.dart'; 

import '../views/auth/login/login_screen.dart';
import '../views/auth/register/register_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/error/no_screen.dart'; 

class Routes {
  static final pages = [
    // SPLASH SCREEN
    // Rute: /splash_screen
    GetPage(
      name: RouteName.splash, 
      page: () => const SplashScreen(),
    ),
    // GetPage(
    //   name: RouteName.login, 
    //   page: () => const LoginScreen(),
    //   transition: Transition.rightToLeft, 
    // ),
    // GetPage(
    //   name: RouteName.register, 
    //   page: () => const RegisterScreen(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: RouteName.noPage,
    //   page: () => const NoScreen(),
    // ),
  
    // GetPage(
    //   name: RouteName.home, 
    //   page: () => const HomeScreen()
    // ),
  ];
}