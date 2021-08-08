import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/Widgets/OwnMessageCard.dart';
import 'package:whatsappsocketio/app/modules/home/Widgets/ReplyMessageCard.dart';
import '../controllers/individual_page_controller.dart';

class IndividualPageView extends GetView<IndividualPageController> {
  @override
  Widget build(BuildContext context) {
    print(controller.sourceChat.id);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
              CircleAvatar(
                child: SvgPicture.asset(
                  controller.chatModel.isGroup
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
                radius: 20,
                backgroundColor: Colors.blueGrey,
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.chatModel.name,
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "last seen today at 12:05",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text("Media, links, and docs"),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notification"),
                  value: "Mute Notification",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Obx(
          () => WillPopScope(
            onWillPop: () {
              if (controller.show.value) {
                controller.show.value = false;
              } else {
                Get.back();
              }
              return Future.value(false);
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.messages.length + 1,
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    itemBuilder: (context, index) {
                      if (index == controller.messages.length) {
                        print(index);
                        return Container(
                          height: 70,
                        );
                      }
                      if (controller.messages[index].type == 'source') {
                        return Column(
                          children: [
                            OwnMessageCard(
                              message: controller.messages[index].message,
                              time: '12:00',
                            ),
                          ],
                        );
                      } else {
                        return ReplyCard(
                          message: controller.messages[index].message,
                          time: '12:00',
                        );
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  controller: controller.controller,
                                  focusNode: controller.focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      controller.sendButton.value = true;
                                      //   setState(() {
                                      //     sendButton = true;
                                      //   });
                                    } else {
                                      controller.sendButton.value = false;
                                      //   setState(() {
                                      //     sendButton = false;
                                      //   });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        controller.show.value
                                            ? Icons.keyboard
                                            : Icons.emoji_emotions_outlined,
                                      ),
                                      onPressed: () {
                                        if (!controller.show.value) {
                                          controller.focusNode.unfocus();
                                          controller.focusNode.canRequestFocus =
                                              false;
                                        }
                                        controller.show.value =
                                            !controller.show.value;
                                        // setState(() {
                                        //   show = !show;
                                        // });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet());
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.camera_alt),
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (builder) =>
                                            //             CameraApp()));
                                          },
                                        ),
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8,
                                right: 2,
                                left: 2,
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xFF128C7E),
                                child: IconButton(
                                  onPressed: () {
                                    controller.scrollController.animateTo(
                                        controller.scrollController.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                    if (controller.sendButton.value) {
                                      controller.sendMessage(
                                        controller.controller.text,
                                        controller.sourceChat.id,
                                        controller.chatModel.id,
                                      );
                                    }
                                    controller.controller.clear();
                                    controller.sendButton.value = false;
                                  },
                                  icon: Icon(controller.sendButton.value
                                      ? Icons.send
                                      : Icons.mic),
                                ),
                              ),
                            ),
                            // controller.show.value ? emojiSelect() : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: Get.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  // Widget emojiSelect() {
  //   return EmojiPicker(
  //       rows: 4,
  //       columns: 7,
  //       onEmojiSelected: (emoji, category) {
  //         print(emoji);
  //         controller.controller.text = controller.controller.text + emoji.emoji;
  //         // setState(() {
  //         //   _controller.text = _controller.text + emoji.emoji;
  //         // });
  //       });
  // }
}
