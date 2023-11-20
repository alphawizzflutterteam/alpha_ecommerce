import 'package:http/http.dart' as http;

class CategoryRepository {

  Future<Cate> categoryListRequest(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(
      url,
    );

    return languageModelFromJson(res.body);
  }
}
