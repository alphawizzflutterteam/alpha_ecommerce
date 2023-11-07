// ignore_for_file: file_names

import 'package:alpha_ecommerce_18oct/data/response/status.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status,this.data,this.message);
 
 
  ApiResponse.loading(): status = Status.LOADING;
  
  ApiResponse.completed(): status = Status.COMPLETED;
  
  ApiResponse.error(): status = Status.ERROR;

  @override
  String toString(){
    return "Status : $status \n Message : \n Data : $data";
  }
} 