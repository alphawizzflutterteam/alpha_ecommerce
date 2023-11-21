import 'package:alpha_ecommerce_18oct/view/home/models/categoryModel.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {

  Future<CategoriesModel> categoryListRequest(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return categoriesModelFromJson(res.body);
  }
}
