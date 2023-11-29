import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:http/http.dart' as http;

class CouponRepository {
  Future<CouponModel> couponListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return couponModelFromJson(res.body);
  }
}
