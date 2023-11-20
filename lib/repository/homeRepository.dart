import 'package:alpha_ecommerce_18oct/model/productDetails.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/brandsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/dailyDealsModel.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/productsModels.dart';
import 'package:alpha_ecommerce_18oct/view/home/models/specialOffersModel.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<BrandsModel> brandsListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return brandsModelFromJson(res.body);
  }

  Future<SpecialOffersModel> specialOffersListApi(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return specialOffersModelFromJson(res.body);
  }

  Future<DailyDealsModel> dailyDealsListApi(String api) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    return dailyDealsModelFromJson(res.body);
  }

  Future<ProductsModel> productsListApi(String api) async {
    final url = Uri.parse(api);

    print(api);
    final http.Response res;
    res = await http.get(
      url,
    );

    return productsModelFromJson(res.body);
  }
}
