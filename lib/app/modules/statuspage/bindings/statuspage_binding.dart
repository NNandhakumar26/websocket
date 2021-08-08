import 'package:get/get.dart';

import '../controllers/statuspage_controller.dart';

class StatuspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatuspageController>(
      () => StatuspageController(),
    );
  }
}
