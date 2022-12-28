import 'package:flutter/cupertino.dart';
import 'package:provider_movie/src/repository/movie_repository.dart';

import '../model/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  MovieRepository _movieRepository = MovieRepository();

  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }
}