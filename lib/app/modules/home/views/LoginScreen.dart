import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/controllers/home_controller.dart';
import 'package:whatsappsocketio/app/modules/home/views/home_view.dart';

import 'SelectContact.dart';

class LoginScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.chatmodels.length,
        itemBuilder: (contex, index) => InkWell(
          onTap: () {
            print(controller.chatmodels[index].name);
            print(controller.chatmodels.map((element) => print(element.name)));
            controller.sourceChat.value = controller.chatmodels.removeAt(index);
            // Get.put(HomeView());
            Get.to(HomeView());
            //Pass The Data as Arguments while using oFF
            print(controller.chatmodels.map((element) => print(element.name)));
          },
          child: ButtonCard(
            name: controller.chatmodels[index].name,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
