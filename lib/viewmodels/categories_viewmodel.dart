import 'package:flutter/material.dart';
import 'package:quiz_app/services/categories_services.dart';
import '../models/categories_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  CategoriesServices categoriesServices = CategoriesServices();
  Categories categories = Categories();
  Category? selectedCategory;
  List<String> amount = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String? selectedAmount;
  List<String> difficulty = ["easy", "medium", "hard"];
  String? selectedDifficulty;

  void setSelectedDifficulty(String difficulty) {
    selectedDifficulty = difficulty;
    notifyListeners();
  }

  void setSelectedAmount(String amount) {
    selectedAmount = amount;
    notifyListeners();
  }

  void setSelectedCategory(Category category) {
    selectedCategory = category;
    notifyListeners();
  }

  Future<void> getCategories() async {
    categories = await categoriesServices.fetchCategories();
    notifyListeners();
  }
}
