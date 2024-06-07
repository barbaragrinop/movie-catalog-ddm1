import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/widgets/movie_listview.dart';

class MoviePageView extends StatefulWidget {
  final List<Movie> movies;
  final int moviesPerPage = 3;

  MoviePageView({required this.movies});

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final totalPages = (widget.movies.length / widget.moviesPerPage).ceil();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: totalPages,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * widget.moviesPerPage;
              final endIndex = (startIndex + widget.moviesPerPage < widget.movies.length)
                  ? startIndex + widget.moviesPerPage
                  : widget.movies.length;

              final pageMovies = widget.movies.sublist(startIndex, endIndex);

              return MovieListView(movies: pageMovies);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: currentPage > 0
                  ? () {
                      _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                    }
                  : null,
            ),
            Text('${currentPage + 1}/$totalPages'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: currentPage < totalPages - 1
                  ? () {
                      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
