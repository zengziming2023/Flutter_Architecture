import 'package:get/get.dart';
import '../network/ApiService.dart';
import '../model/Task.dart';

class HomeViewModel extends GetxController {
  var count = 0.obs;

  increment() => count++;

  Future<List<Task>> getTasks() async {
    return await ApiService.getInstance().getRestClient().getTasks();
  }
}
