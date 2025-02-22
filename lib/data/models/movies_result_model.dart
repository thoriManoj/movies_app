import 'package:movies_app/data/models/movie_model.dart';

class MoviesResultModel {
  List<MovieModel> movies;

  MoviesResultModel({
    this.movies,
  });

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      movies = List<MovieModel>();
      json['results'].forEach((v) {
        movies.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
