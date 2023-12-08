import 'package:flutter/cupertino.dart';

void printStackTrace() {
  // 使用StackTrace.current获取当前堆栈信息
  var stackTrace = StackTrace.current;

  // 使用toString()方法打印堆栈信息
  debugPrint(stackTrace.toString());
}
