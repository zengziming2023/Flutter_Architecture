import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/Other.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final homeViewModel = Get.put(HomeViewModel());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(
        title: Obx(() => Text("Clicks : ${homeViewModel.count}")),
      ),

      // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to other."),
          onPressed: () => {Get.to(const Other())},
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          homeViewModel.increment();

          homeViewModel
              .getTasks()
              .then((value) => debugPrint("value = $value"))
              .catchError((error) {
            debugPrint("error xxx = $error");
          });
        },
      ),
    );
  }
}
