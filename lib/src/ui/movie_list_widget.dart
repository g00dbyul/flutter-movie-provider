import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movie/src/provider/movie_provider.dart';

import '../model/movie.dart';

class MovieListWidget extends StatelessWidget {
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        Image.network(movie.posterUrl),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(movie.overview, style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis, maxLines: 5)
              ],
            )
        )
      ],
    );
  }

  Widget _makeListVew(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200,
            color: Colors.white,
            child: _makeMovieOne(movies[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: movies.length
    );
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Movie Provider'),
      // ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if(provider.movies != null && provider.movies.length > 0) {
            return _makeListVew(provider.movies);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}