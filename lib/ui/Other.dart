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
          appBar: AppBar(
            title: const Text("other page"),
          ),
          body: Center(
            child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.green),
                        child: Container(
                          width: 375,
                          // height: 50,
                          decoration: const BoxDecoration(color: Colors.blue),
                          margin: const EdgeInsets.all(30.0),
                          child: InkWell(
                            child: Text(
                              "controller controllercontrollercontroller count = ${c.count}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              softWrap: true,
                              overflow: null,
                              // TextOverflow.ellipsis,
                              textScaleFactor: 2.0,
                              // maxLines: 2
                            ),
                            onTap: () {
                              debugPrint("inside tap");
                              Get.back();
                            },
                          ),
                        )),
                  ),
                  onTap: () {
                    debugPrint("outsize tap");
                    c.increment();
                    Get.back();
                  },
                )),
          ));
    };
  }
}
