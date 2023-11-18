import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import '../model/Task.dart';

///这里要注意，一定要创建文件rest_client.g.dart并添加part
part 'RestClient.g.dart';

@RestApi(baseUrl: "https://wanandroid")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();
}
