// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class ApiProvider {
  late Dio _dio;
  String aToken = '';

  final BaseOptions options = BaseOptions(
    baseUrl: 'http://admin.brikow.com/api/contractor/add_project',
    connectTimeout: 15000,
    receiveTimeout: 13000,
  );
  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() => _instance;
  ApiProvider._internal() {
    _dio = Dio(options);
    // _dio.interceptors
    // .add(InterceptorsWrapper(onRequest: (Options options) async {
    _dio.interceptors.requestLock.lock();
    options.headers["cookies"] = aToken;
    _dio.interceptors.requestLock.unlock();
    // return options; //continue
    // }));
  }

  Future login() async {
    final request = {
      "phonenumber": "1234567890",
      "otp": "123456",
      "token": "123456"
    };
    final response = await _dio.post(
        'http://admin.brikow.com/api/contractor/add_project',
        data: request);
    //get cooking from response
    final cookies = response.headers.map['set-cookie'];
    if (cookies!.isNotEmpty && cookies.length == 2) {
      final authToken = cookies[1]
          .split(';')[0]; //it depends on how your server sending cookie
      //save this authToken in local storage, and pass in further api calls.

      aToken =
          authToken; //saving this to global variable to refresh current api calls to add cookie.
      print(authToken);
    }

    print(cookies);
    //print(response.headers.toString());
  }

  /// If we call this function without cookie then it will throw 500 err.
  Future getRestaurants() async {
    final response =
        await _dio.post('/admin.brikow.com/api/contractor/add_project');

    print(response.data.toString());
  }
}
