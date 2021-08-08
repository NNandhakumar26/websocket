import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/bindings/ChatModal.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  final count = 0.obs;

  final groupmember = [].obs;

  late final sourceChat = ChatModel().obs;
  final chatmodels = [
    ChatModel(
      name: "Nandha",
      isGroup: false,
      currentMessage: "The Mind is everything",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Saran",
      isGroup: false,
      currentMessage: "Show me the code",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "Gurumutharasi",
      isGroup: false,
      currentMessage: "This is Guru",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Sneha",
      isGroup: false,
      currentMessage: "I've completed the work",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  //dispose
  //dispose the tab controller
}
