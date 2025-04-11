import 'package:alpha_ecommerce_18oct/view/profile/coupon/model/couponListModel.dart';
import 'package:alpha_ecommerce_18oct/view/profile/faqs/model/faqsModel.dart';
import 'package:http/http.dart' as http;

class FAQRepository {
  Future<FaqModel> faqListRequest(String api, String bearerToken) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url, headers: {
      'Authorization': 'Bearer $bearerToken',
    });

    return faqModelFromJson(res.body);
  }
}
