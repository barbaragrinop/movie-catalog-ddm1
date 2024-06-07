import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/widgets/movie_listview.dart';

class MoviePageView extends StatelessWidget {
  final List<Movie> movies;
  final int moviesPerPage = 5;

  MoviePageView({required this.movies});

  @override
  Widget build(BuildContext context) {
    final totalPages = (movies.length / moviesPerPage).ceil();

    return PageView.builder(
      itemCount: totalPages,
      itemBuilder: (context, pageIndex) {
        final startIndex = pageIndex * moviesPerPage;
        final endIndex = (startIndex + moviesPerPage < movies.length)
            ? startIndex + moviesPerPage
            : movies.length;

        final pageMovies = movies.sublist(startIndex, endIndex);

        return MovieListView(movies: pageMovies);
      },
    );
  }
}
