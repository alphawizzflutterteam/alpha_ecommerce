
// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:alpha_ecommerce_18oct/data/appException.dart';
import 'package:alpha_ecommerce_18oct/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices{


  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic resopnseJson;
    try{

      final response =  await http.post(
        Uri.parse(url),body: data
      ).timeout(const Duration(seconds: 10));
      resopnseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return resopnseJson;
    
  }

  @override
  Future getResponse(String url) async {
    dynamic resopnseJson;
    try{
      final response =  await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      resopnseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return resopnseJson;
  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonEncode(response.body);
      return responseJson;

      case 400:
            throw BadRequestException('Bad Request ${response.body.toString()}with status code ${response.statusCode}');

      default: 
      throw FetchDataException('Error occurred while communicating with server with status code ${response.statusCode}');
      
    }
  }

}