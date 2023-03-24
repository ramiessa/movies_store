class MoviesModel {
  List<Movie> Movies = [];

  MoviesModel.fromJson(Map<String, dynamic> json) {
    json['movies'].forEach((element) {
      Movies.add(Movie.fromJson(element));
    });
  }
}

class Movie {
  int? id;
  int? categoryId;
  dynamic title;
  dynamic summary;
  List<Actor> actors = [];
  dynamic rating;
  String? youtube_video_id;
  int? year;
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    summary = json['summary'];
    json['actors'].forEach((element) {
      actors.add(Actor.fromJson(element));
    });
  }
}

class Actor {
  int? id;
  dynamic name;
  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
