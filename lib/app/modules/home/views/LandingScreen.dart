import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappsocketio/app/modules/home/controllers/home_controller.dart';

class LandingScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to Messaging Application",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: Get.height / 8,
            ),
            Image.asset(
              "assets/bg.png",
              color: Colors.greenAccent[700],
              height: 340,
              width: 340,
            ),
            SizedBox(
              height: Get.height / 7.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "Agree and Continue to accept the",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    TextSpan(
                      text: "whatsapp Terms",
                      style: TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: Get.width,
                height: 50,
                child: Card(
                  margin: EdgeInsets.all(0),
                  elevation: 8,
                  color: Colors.greenAccent[700],
                  child: Center(
                    child: Text(
                      'Agree and Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
