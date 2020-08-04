
import 'package:dio/dio.dart';
import 'config.dart';



import 'package:dio/dio.dart';
import 'config.dart';

class HTTPRequest {

  static final baseOptional = BaseOptions(baseUrl: HTTP_Config.baseUrl,connectTimeout: HTTP_Config.timeOut);
  static final dio = Dio(baseOptional);

  static Future<T> request<T>(String url , {
    String method = "get",
    Map<String,dynamic>params,
    Interceptor inter,
  }) async {

    // 创建 option
    final optionl = Options(method: method);

    Interceptor _interceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print("http request on request");
        return options;
      },
      onResponse: (Response r){
        print("http request on response");
        return r;
      },
      onError: (DioError e){
        print("http request on error");
        return e;
      }
    );

    List<Interceptor>inters = [_interceptor];
    if(inter != null){
      inters.add(inter);
    }
    // 添加所有拦截器
    dio.interceptors.addAll(inters);

    // 开始请求
    try{
      Response res = await dio.request(url,queryParameters: params,options: optionl);
      return res.data;
    } on DioError catch(e) {
      return Future.error(e);
    }

  }

}
