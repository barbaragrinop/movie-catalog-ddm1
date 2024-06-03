import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/screens/movie_details_screen.dart';
import 'package:movie_catalog/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie(
      title: "Inception",
      synopsis: "A mind-bending thriller...",
      cast: "Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page",
      year: 2010,
      genre: "Sci-Fi",
      imageUrl: "https://m.media-amazon.com/images/I/71SBgi0X2KL._AC_UF894,1000_QL80_.jpg",
    ),
    // Adicione mais filmes aqui
  ];

  String selectedGenre = 'All';

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies = selectedGenre == 'All'
        ? movies
        : movies.where((movie) => movie.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Filmes'),
        actions: [
          DropdownButton<String>(
            value: selectedGenre,
            items: <String>['All', 'Sci-Fi', 'Action', 'Drama'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGenre = newValue!;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredMovies.length,
        itemBuilder: (ctx, index) {
          return MovieCard(movie: filteredMovies[index]);
        },
      ),
    );
  }
}
