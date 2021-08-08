import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:whatsappsocketio/app/modules/home/bindings/ChatModal.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsappsocketio/app/modules/home/bindings/MessageModels.dart';
import 'package:whatsappsocketio/app/modules/home/controllers/home_controller.dart';

class IndividualPageController extends GetxController {
  late final ChatModel chatModel;
  final show = false.obs;
  FocusNode focusNode = FocusNode();
  final sendButton = false.obs;
  // List<MessageModel> messages = [];
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  // var? IO.Socket socket;
  // final temp = HomeController();
  late final ChatModel sourceChat;
  IO.Socket socket = IO.io('https://afternoon-sierra-11319.herokuapp.com',
      OptionBuilder().setTransports(['websocket']).build());
  final count = 0.obs;

  final messages = <MessageModel>[].obs;
  @override
  void onInit() {
    super.onInit();

    chatModel = Get.arguments[0];
    sourceChat = Get.arguments[1];
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show.value = false;
      }
    });
    connect();
  }

  void connect() {
    try {
      socket.onConnect((_) {
        print('connect');
        socket.emit('signin', sourceChat.id);
        socket.on('message', (msg) {
          print(msg);
          setMessage("destination", msg["message"]);
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        });
      });

      //When an event recieved from server, data is added to the stream
      // socket.on('event', (data) => streamSocket.addResponse);
      socket.onDisconnect((_) => print('disconnect'));
      print(socket.connected);
    } catch (e) {
      print(e.toString());
    }
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
      message: message,
      type: type,
    );
    messages.add(messageModel);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
