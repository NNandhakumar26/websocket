import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraPage extends GetView<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CameraPage')),
      body: SafeArea(child: Text('CameraPage')),
    );
  }
}
