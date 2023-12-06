import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/base/BaseStatelessWidget.dart';
import 'package:flutter_architecture/view_model/tab_home_view_model.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TabHomePage extends BaseStatelessWidget<TabHomeViewModel> {
  TabHomePage(this.showText, {super.key});

  final String showText;

  @override
  GetControllerBuilder<TabHomeViewModel> getControllerBuilder(
      TabHomeViewModel viewModel) {
    return (viewModel) {
      return ConstraintLayout(
        children: [
          Text("text $showText center").applyConstraint(centerTo: parent),
          Text("text $showText top left")
              .applyConstraint(left: parent.left, top: parent.top),
          Text("text $showText top right")
              .applyConstraint(right: parent.right, top: parent.top),
          Text("text $showText bottom left")
              .applyConstraint(left: parent.left, bottom: parent.bottom),
          Text("text $showText bottom right")
              .applyConstraint(right: parent.right, bottom: parent.bottom)
        ],
      );
    };
  }
}
