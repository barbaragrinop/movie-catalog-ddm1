import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(movie.imageUrl),
              const SizedBox(height: 8.0),
              Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text('Year: ${movie.year}'),
              const SizedBox(height: 8.0),
              Text('Genre: ${movie.genre}'),
              const SizedBox(height: 8.0),
              Text('Cast: ${movie.cast}'),
              const SizedBox(height: 8.0),
              const Text('Synopsis:'),
              const SizedBox(height: 8.0),
              Text(movie.synopsis),
            ],
          ),
        )));
  }
}
