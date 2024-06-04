import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/screens/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.red,
      
      child: ListTile(
        leading: Image.network(movie.imageUrl),
        title: Text(movie.title),
        subtitle: Text('${movie.year}'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MovieDetailsScreen(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
