import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/controllers/home_controller.dart';
import 'package:whatsappsocketio/app/modules/home/views/CustomCard.dart';
import 'package:whatsappsocketio/app/modules/home/views/SelectContact.dart';

class ChatPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print(controller.chatmodels.map((element) => print(element.name)));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SelectContact());
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: controller.chatmodels.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                '/individual-page',
                arguments: [
                  controller.chatmodels[index],
                  controller.sourceChat.value
                ],
              );
            },
            child: CustomCard(
              index: index,
            ),
            // child: CustomCard(
            //   chatModel: controller.chatmodels[index],
            // ),
          );
        },
      ),
      // ),
    );
  }
}
