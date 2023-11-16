import 'package:alpha_ecommerce_18oct/data/network/baseApiServices.dart';
import 'package:alpha_ecommerce_18oct/data/network/networkApiService.dart';
import 'package:alpha_ecommerce_18oct/utils/appUrls.dart';

class AuthRepository{


  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApiRequest(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.baseURL+AppUrl.test, data);
      
      return response;
    }catch(e){

    }
  }
}
