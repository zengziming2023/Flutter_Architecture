import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/model/User.dart';
import 'package:flutter_architecture/ui/Other.dart';
import 'package:flutter_architecture/ui/Second.dart';
import 'package:flutter_architecture/ui/view_page_demo.dart';
import 'package:flutter_architecture/utils/Singleton.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';

class Home extends BaseStatelessWidget<HomeViewModel> {
  Home({super.key});

  void testJsonSerial() {
    // test json serial
    final User user = User(name: "nick", age: 23);
    debugPrint("org user = $user");
    String jsonStr = jsonEncode(user);
    debugPrint("jsonStr = $jsonStr");

    User decodeUser = User.fromJson(jsonDecode(jsonStr));
    decodeUser.name = "change ${decodeUser.name}";
    debugPrint("decodeUser = $decodeUser");
  }

  void testKeyValueStorage() {
    var mmkv = MMKV.defaultMMKV();
    mmkv.encodeString("testStr", "testStr_value");

    var decodeStr = mmkv.decodeString("testStr");
    debugPrint("test mmkv decodeStr = $decodeStr");
  }

  @override
  GetControllerBuilder<HomeViewModel> getControllerBuilder(
      HomeViewModel viewModel) {
    testJsonSerial();
    testKeyValueStorage();
    Singleton().doSomething();

    // 使用MediaQuery获取屏幕的宽度和高度
    var mediaQueryData = MediaQuery.of(Get.context!);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double devicePixelRatio = mediaQueryData.devicePixelRatio;

    return (viewModel) {
      return Scaffold(
        // 使用Obx(()=>每当改变计数时，就更新Text()。
        appBar: AppBar(
          title: Obx(() {
            debugPrint("count change ${viewModel.count}");
            return Text(
              "Clicks : ${viewModel.count}",
              style: TextStyle(fontSize: 18.sp),
            );
          }),
        ),

        // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text(
                  "Go to other.",
                  style: TextStyle(fontSize: 18.sp),
                ),
                onPressed: () => {Get.to(() => Other())},
              ),
              ElevatedButton(
                child: const Text("Go to second."),
                onPressed: () => {Get.to(() => Second())},
              ),
              CachedNetworkImage(
                imageUrl: "https://picsum.photos/250?image=9",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
              Image.asset(
                'assets/images/test.jpg',
                width: 200.w,
                height: null,
                fit: BoxFit.cover,
              ),
              Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  width: 375.w,
                  height: 100.w,
                  child: Text("window logicWidth = $screenWidth \n"
                      "window logicHeight = $screenHeight \n"
                      "devicePixelRatio = $devicePixelRatio \n"
                      "screenWidth = ${screenWidth * devicePixelRatio}\n"
                      "screenHeight = ${screenHeight * devicePixelRatio}")),
              InkWell(
                child: Text(
                  "test view page",
                  style: TextStyle(fontSize: 18.sp),
                ),
                onTap: () => Get.to(() => ViewPageDemo()),
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            viewModel.increment();

            viewModel
                .getTasks()
                .then((value) => debugPrint("value = $value"))
                .catchError((error) {
              debugPrint("error xxx = $error");
            });
          },
        ),
      );
    };
  }
}
