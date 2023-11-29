import 'package:alpha_ecommerce_18oct/view/vendor/model/vendorModel.dart';
import 'package:http/http.dart' as http;

class VendorRepository {
  Future<VendorModel> vendorListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return vendorModelFromJson(res.body);
  }
}
