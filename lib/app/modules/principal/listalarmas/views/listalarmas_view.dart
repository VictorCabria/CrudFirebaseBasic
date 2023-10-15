import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/listalarmas_controller.dart';

class ListalarmasView extends GetView<ListalarmasController> {
  const ListalarmasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListalarmasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListalarmasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
