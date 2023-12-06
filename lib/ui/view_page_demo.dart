import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/ui/tab/tab_home_page.dart';
import 'package:flutter_architecture/view_model/view_page_demo_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ViewPageDemo extends BaseStatelessWidget<ViewPageDemoViewModel> {
  ViewPageDemo({super.key});

  @override
  GetControllerBuilder<ViewPageDemoViewModel> getControllerBuilder(
      ViewPageDemoViewModel viewModel) {
    return (viewModel) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("view page demo"),
        ),
        body: TabBarView(
          controller: viewModel.getTabController(),
          children: [
            TabHomePage("tab 1"),
            TabHomePage("tab 2"),
            TabHomePage("tab 3"),
          ],
        ),
        bottomNavigationBar: getTabBar(viewModel),
      );
    };
  }

  TabBar getTabBar(ViewPageDemoViewModel viewModel) {
    return TabBar(
        tabs: [
          Container(
            padding: EdgeInsets.all(16.w),
            child: const Text("tab 1"),
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            child: const Text("tab 2"),
          ),
          Container(
            padding: EdgeInsets.all(16.w),
            child: const Text("tab 3"),
          ),
        ],
        controller: viewModel.getTabController(),
        padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
        unselectedLabelColor: Colors.black,
        labelColor: Colors.red,
      );
  }
}
