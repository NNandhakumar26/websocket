import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/bindings/ChatModal.dart';

import '../controllers/individual_page_controller.dart';

class IndividualPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndividualPageController>(
      () => IndividualPageController(),
    );
  }
}
