import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/BaseViewModel.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class ViewPageDemoViewModel extends BaseViewModel
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(length: 3, vsync: this);
  }

  TabController getTabController() => _tabController;
}
