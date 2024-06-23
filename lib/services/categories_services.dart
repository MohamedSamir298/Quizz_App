import 'dart:convert';
import '../models/categories_model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  Future<Categories> fetchCategories() async {
    try {
      var response = await http.get(Uri.parse(Constants().categoriesUrl));

      if (response.statusCode == 200) {
        return Categories.fromJson(jsonDecode(response.body));
      } else {
        return Categories();
      }
    } catch (e) {
      return Categories();
    }
  }
}
