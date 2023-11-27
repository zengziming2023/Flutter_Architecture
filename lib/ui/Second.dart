import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:flutter_architecture/view_model/second_view_model.dart';
import 'package:get/get.dart';

class Second extends BaseStatelessWidget<SecondViewModel> {
  Second({super.key});

  final HomeViewModel c = Get.find();

  @override
  GetControllerBuilder<SecondViewModel> getControllerBuilder(
      SecondViewModel viewModel) {
    return (viewModel) {
      return Scaffold(
        body: Center(
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: Colors.red
              ),
              child: Text("Second page..${c.count}"),
            ),
            onTap: () => {Get.back()},
          ),
        ),
      );
    };
  }
}
