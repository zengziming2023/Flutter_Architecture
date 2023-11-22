import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:flutter_architecture/view_model/OtherViewModel.dart';
import 'package:get/get.dart';

class Other extends BaseStatelessWidget<OtherViewModel> {
  Other({super.key});

  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final HomeViewModel c = Get.find();

  @override
  GetControllerBuilder<OtherViewModel> getControllerBuilder(
      OtherViewModel viewModel) {
    // 访问更新后的计数变量
    return (viewModel) {
      return Scaffold(
        body: Center(
            child: InkWell(
          child: Text("controller count = ${c.count}"),
          onTap: () => {Get.back()},
        )),
      );
    };
  }
}
