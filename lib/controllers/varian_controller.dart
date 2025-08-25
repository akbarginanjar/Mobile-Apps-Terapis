import 'package:terapis/global_resource.dart';

class VarianController extends GetxController {
  int? select;
  int currentIndex = 0;

  void changeSelect(int value) {
    select = value;
    // currentIndex = value;
    update();
  }
}
