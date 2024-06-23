class Categories {
  List<Category>? categories;
  Categories({this.categories});
  Categories.fromJson(Map<String, dynamic> data) {
    if (data['trivia_categories'] != null) {
      categories = <Category>[];
      data['trivia_categories'].forEach((v) {
        categories?.add(Category.fromJson(v));
      });
    }
  }
}

class Category {
  int? id;
  String? name;
  Category({this.name, this.id});
  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
