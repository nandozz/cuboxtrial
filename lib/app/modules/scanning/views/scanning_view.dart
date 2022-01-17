import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scanning_controller.dart';

class ScanningView extends GetView<ScanningController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScanningView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScanningView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
