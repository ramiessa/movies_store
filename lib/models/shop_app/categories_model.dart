class CategoriesModel {
  List<Movie> categories = [];

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    json['categories'].forEach((element) {
      categories.add(Movie.fromJson(element));
    });
  }
}

class Movie {
  int? id;
  String? title;

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
