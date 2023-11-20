import 'package:flutter_architecture/base/BaseViewModel.dart';
import 'package:flutter_architecture/model/Task.dart';
import 'package:flutter_architecture/network/ApiService.dart';
import 'package:get/get.dart';

class HomeViewModel extends BaseViewModel {
  var count = 0.obs;

  increment() => count++;

  Future<List<Task>> getTasks() async {
    return await ApiService.getInstance().getRestClient().getTasks();
  }
}
