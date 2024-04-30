

import 'package:get/get.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/form/date_controller.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/pdf/pdf_controller.dart';
import 'package:seustudyassist/coverPage/features/personalization/controllers/pdf/pdf_theme_controller.dart';

import 'features/personalization/controllers/form/field_controller.dart';
import 'features/personalization/controllers/form/form_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
    Get.put(PDFController());
    Get.put(FormController());
    Get.put(FieldController());
    Get.put(PdfThemeController());
  }
}
