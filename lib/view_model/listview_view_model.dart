import 'package:flutter_architecture/base/BaseViewModel.dart';
import 'package:get/get.dart';

class ListviewViewModel extends BaseViewModel {
  var count = 4.obs;

  void increment() {
    count++;
  }
}
