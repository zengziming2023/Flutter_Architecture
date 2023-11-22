import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/base/BaseViewModel.dart';
import 'package:get/get.dart';

abstract class BaseStatelessWidget<T extends BaseViewModel>
    extends StatelessWidget {
  BaseStatelessWidget({super.key});

  final T _viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _viewModel,
      builder: getControllerBuilder(_viewModel),
    );
  }

  GetControllerBuilder<T> getControllerBuilder(T viewModel);
}
