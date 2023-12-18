import 'package:alpha_ecommerce_18oct/view/language/language.dart';
import 'package:http/http.dart' as http;

class LangugageRepository {
  Future<LanguageModel> languageListRequest(String api) async {
    final url = Uri.parse(api);

    final http.Response res;
    res = await http.get(url,);

    return languageModelFromJson(res.body);
  }
}
