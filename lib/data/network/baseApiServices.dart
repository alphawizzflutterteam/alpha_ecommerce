
// ignore_for_file: file_names

abstract class BaseApiServices{

  Future<dynamic> getResponse(String url);

  Future<dynamic> getPostApiResponse(String url,dynamic data);

}