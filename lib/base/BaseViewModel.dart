import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    debugPrint("${runtimeType.toString()}: onInit");
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("${runtimeType.toString()}: onReady");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("${runtimeType.toString()}: onClose");
  }
}
