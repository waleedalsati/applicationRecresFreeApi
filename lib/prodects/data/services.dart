

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:trainingapp/prodects/data/modelProdect.dart';

import '../../users/data/model/UsersResponse.dart';


part 'services.g.dart';
@RestApi(baseUrl:"https://reqres.in/api/")
abstract class Services {


  factory Services(Dio dio, {String? baseUrl}) = _Services;
@GET("collections/products/records")
Future<dataresponse>getaallprodect(@Header('x-api-key') String apiKey,);
@GET('users')
Future<responseUsers>getallusers(@Header('x-api-key')String apikey);
 }




  Dio CreateandSetup(){


    Dio dio =Dio();

dio.options.receiveTimeout=Duration(seconds: 15);
dio.options.connectTimeout=Duration(seconds: 20);
dio.interceptors.add(
  LogInterceptor(
    request: true,
    requestHeader: false,
    requestBody: false,
    error: false,
    responseBody: false,
    responseHeader: false



  )



);



return dio;
}