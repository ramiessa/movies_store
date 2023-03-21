class CategoriesModel {
  List<Categories> categories = [];

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    json['categories'].forEach((element) {
      categories.add(Categories.fromJson(element));
    });
  }
}

class Categories {
  int? id;
  String? title;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
