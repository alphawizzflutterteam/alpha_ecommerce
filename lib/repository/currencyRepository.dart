import 'package:alpha_ecommerce_18oct/view/currency_selection/currencyModel.dart';
import 'package:http/http.dart' as http;

class CurrencyRepository {
  Future<CurrencyModel> currencyListRequest(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return currencyModelFromJson(res.body);
  }
}
