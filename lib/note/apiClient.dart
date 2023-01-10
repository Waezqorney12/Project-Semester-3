import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;

  //App that will talk to the server
  final String appBaseUrl;

  // for storing data local or convert data to map
  // String for the key and the value is String
  late Map<String, String> _mainHeaders;

  // Map is using {}
  // List is using []
  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    //Get or Post data from the server along 30 seconds and if fail will stop
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type':'application/json; charset = UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async{
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}