import 'package:douapp/Tools/http_request.dart';
import 'package:douapp/Tools/config.dart';
class HomeRequest {
  static Future<T> requestMoveList<T>(int start ,{count = Home_Config.movieCount}) async {
    // url
    final movieURL = "/movie/top250?start=$start&count=${count}";
    print("movie url$movieURL");
    final request =  await HTTPRequest.request(movieURL).then((value){
      print(value);
    });
    print(request);
  }
}