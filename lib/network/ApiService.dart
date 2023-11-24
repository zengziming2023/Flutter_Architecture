import 'RestClient.dart';
import 'package:dio/dio.dart';

class ApiService {
  static ApiService? _instance;

  late RestClient _clientInstance;

  // 私有构造函数
  ApiService._() {
    final dio = Dio(); // Provide a dio instance
    _clientInstance = RestClient(dio);
  }

  // 获得单例
  static ApiService getInstance() {
    _instance ??= ApiService._();
    return _instance!;
  }

  RestClient getRestClient() {
    return _clientInstance;
  }
}
