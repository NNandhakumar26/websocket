import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/controllers/home_controller.dart';

class CustomCard extends GetView<HomeController> {
  // final ChatModel chatModel;

  // CustomCard({required this.chatModel});
  final index;
  CustomCard({this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: SvgPicture.asset(
              controller.chatmodels[index].isGroup
                  ? "assets/groups.svg"
                  : "assets/person.svg",
              color: Colors.white,
              height: 36,
              width: 36,
            ),
            backgroundColor: Colors.blueGrey,
          ),
          title: Text(
            controller.chatmodels[index].name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(
                width: 3,
              ),
              Text(
                controller.chatmodels[index].currentMessage,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          trailing: Text(controller.chatmodels[index].time),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 80),
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
