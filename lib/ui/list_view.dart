import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/view_model/listview_view_model.dart';
import 'package:get/get.dart';

class ListViewPage extends BaseStatelessWidget<ListviewViewModel> {
  ListViewPage({super.key});

  @override
  GetControllerBuilder<ListviewViewModel> getControllerBuilder(
      ListviewViewModel viewModel) {
    return (viewModel) {
      return Scaffold(
          appBar: AppBar(
            title: InkWell(
              child: Obx(() {
                debugPrint("count = ${viewModel.count}");
                return Text("list view title ${viewModel.count}");
              }),
              onTap: () {
                // Get.back();
                viewModel.increment();
              },
            ),
          ),
          body: RepaintBoundary(
            child: Obx(() {
              return ListView.builder(
                  itemCount: viewModel.count.value,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.start),
                      title: Text("content $index"),
                      iconColor: index % 2 == 0 ? Colors.red : Colors.green,
                    );
                  });
            }),
          ));
    };
  }
}
