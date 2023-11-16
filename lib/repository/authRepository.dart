
import 'package:alpha_ecommerce_18oct/viewModel/responseModel/loginOtpResponseModel.dart';
import 'package:http/http.dart' as http;

class AuthRepository {

   Future<LoginOtpResponseModel> loginApiReqzuest(
      String api, dynamic data) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.post(url, body: data);

    return loginOtpResponseModelFromJson(res.body);
  }

}
