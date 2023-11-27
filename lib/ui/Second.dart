import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:flutter_architecture/view_model/second_view_model.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get.dart';

class Second extends BaseStatelessWidget<SecondViewModel> {
  Second({super.key});

  final HomeViewModel c = Get.find();

  @override
  GetControllerBuilder<SecondViewModel> getControllerBuilder(
      SecondViewModel viewModel) {
    return (viewModel) {
      final idCenter = ConstraintId("center");

      return Scaffold(
        body: ConstraintLayout(
          children: [
            center().applyConstraint(
                id: idCenter,
                centerTo: parent,
                width: wrapContent,
                height: wrapContent),
            Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  child: const Text(
                    "test text test text test text..",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    debugPrint("test padding...");
                  },
                )).applyConstraint(
                width: wrapContent,
                top: idCenter.bottom,
                left: idCenter.left,
                margin: const EdgeInsets.only(top: 20),
                clickPadding: const EdgeInsets.all(20)),
            // centerTo: parent)
          ],
        ),
      );
    };
  }

  InkWell center() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(color: Colors.red),
        child: Text("Second page..${c.count}"),
      ),
      onTap: () => {Get.back()},
    );
  }
}
