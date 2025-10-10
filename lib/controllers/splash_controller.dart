import 'package:get/get.dart';
import '../routes/routes_pages.dart';

class SplashController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    // Get.offNamed(RouteName.login); 
  }
}