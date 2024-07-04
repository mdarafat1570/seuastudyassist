

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'form_controller.dart';

class FieldController extends GetxController {
  static FieldController get instance => Get.find();

  final formController = FormController.instance;
  bool _isAssignment = true;
  bool get isAssignment => _isAssignment;

  void fieldShow() {
    if (formController.coverPageController.text == "Lab Report") {
      _isAssignment = false;
      update();
    } else {
      _isAssignment = true;
      update();
    }
  }
}
