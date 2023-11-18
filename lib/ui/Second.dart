import 'package:flutter/material.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:get/get.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel c = Get.find();

    return Scaffold(
      body: Center(
        child: Text("Second page..${c.count}"),
      ),
    );
  }
}
