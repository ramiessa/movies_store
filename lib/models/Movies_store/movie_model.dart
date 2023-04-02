class MoviesModel {
  List<Movie> movies = [];
  List<Movie> drama = [];
  MoviesModel() {}
  MoviesModel.fromJson(Map<String, dynamic> json) {
    json['movies'].forEach((element) {
      movies.add(Movie.fromJson(element));
    });
  }
}

class Movie {
  int? id;
  int? categoryId;
  dynamic title;
  dynamic summary;
  List<Actor> actors = [];
  List<String> writers = [];

  dynamic director;
  dynamic rating;
  String? youtube_video_id;
  String? year;
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    director = json['director'];
    title = json['title'];
    summary = json['summary'];
    rating = json['rating'];
    year = json['year'];
    json['actors'].forEach((element) {
      actors.add(Actor.fromJson(element));
    });
    json['writers'].forEach((element) {
      writers.add(element);
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
