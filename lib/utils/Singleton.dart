import 'package:flutter/cupertino.dart';

class Singleton {
  static Singleton? _singleton;

  /// 工厂函数返回单例
  factory Singleton() {
    _singleton ??= Singleton._internal();
    return _singleton!;
  }

  /// 私有构造函数
  Singleton._internal();

  void doSomething() {
    debugPrint("do something..");
  }
}
