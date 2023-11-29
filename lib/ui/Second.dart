import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/ui/list_view.dart';
import 'package:flutter_architecture/view_model/HomeViewModel.dart';
import 'package:flutter_architecture/view_model/second_view_model.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get.dart';

class Second extends BaseStatelessWidget<SecondViewModel> {
  Second({super.key});

  final HomeViewModel homeViewModel = Get.find();

  @override
  GetControllerBuilder<SecondViewModel> getControllerBuilder(
      SecondViewModel viewModel) {
    return (viewModel) {
      final idCenter = ConstraintId("center");
      final idTestText = ConstraintId("testText");

      return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: ConstraintLayout(
          children: [
            center(viewModel).applyConstraint(
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
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      onTap: () {
                        debugPrint("test padding...");
                        Get.to(() => ListViewPage());
                      },
                    ))
                .applyConstraint(
                    id: idTestText,
                    width: wrapContent,
                    top: idCenter.bottom,
                    left: idCenter.left,
                    margin: const EdgeInsets.only(top: 20),
                    clickPadding: const EdgeInsets.all(20)),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.green),
              child: InkWell(
                child: const Text(
                  "show dialog",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                onTap: () async => await showTextDialog(),
              ),
            ).applyConstraint(
                left: idTestText.left,
                top: idTestText.bottom,
                margin: const EdgeInsets.only(top: 18),
                clickPadding: const EdgeInsets.all(18))
            // centerTo: parent)
          ],
        ),
      );
    };
  }

  InkWell center(SecondViewModel viewmodel) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(color: Colors.red),
        child: Text(
          "Second page..${homeViewModel.count}",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      onTap: () {
        homeViewModel.increment();
        // need to manual call update when homeViewModel data update to notify SecondPage update ui.
        viewmodel.update();
      },
    );
  }

  showTextDialog() async {
    debugPrint("show dialog");
    // Get.dialog(const Center(
    //   child: Text(
    //     "text dialog",
    //     style: TextStyle(
    //       fontSize: 24,
    //     ),
    //   ),
    // ));

    await Get.defaultDialog(
        title: "dialog title",
        content: const Text("dialog content"),
        textConfirm: "confirm",
        textCancel: "cancel",
        onConfirm: () {
          debugPrint('on confirm : ${Get.isOverlaysOpen}');
          Get.back();
        },
        onCancel: () {
          debugPrint("on cancel click.");
          // Get.back(result: false, closeOverlays: true, canPop: false);
        },
        barrierDismissible: true);
  }
}
