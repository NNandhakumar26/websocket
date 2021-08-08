import 'package:get/get.dart';

import 'package:whatsappsocketio/app/modules/IndividualPage/bindings/individual_page_binding.dart';
import 'package:whatsappsocketio/app/modules/IndividualPage/views/individual_page_view.dart';
import 'package:whatsappsocketio/app/modules/home/bindings/home_binding.dart';
import 'package:whatsappsocketio/app/modules/home/views/LoginScreen.dart';
import 'package:whatsappsocketio/app/modules/home/views/home_view.dart';
import 'package:whatsappsocketio/app/modules/statuspage/bindings/statuspage_binding.dart';
import 'package:whatsappsocketio/app/modules/statuspage/views/statuspage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LoginScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INDIVIDUAL_PAGE,
      page: () => IndividualPageView(),
      binding: IndividualPageBinding(),
    ),
    GetPage(
      name: _Paths.STATUSPAGE,
      page: () => StatuspageView(),
      binding: StatuspageBinding(),
    ),
  ];
}
