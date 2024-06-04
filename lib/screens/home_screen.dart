import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/widgets/movie_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      imageUrl:
          "https://m.media-amazon.com/images/I/71SBgi0X2KL._AC_UF894,1000_QL80_.jpg",
    ),
    // Add more movies here
  ];

  String selectedGenre = 'Todos';

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies = selectedGenre == 'Todos'
        ? movies
        : movies.where((movie) => movie.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Filmes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedGenre,
              items: <String>['Todos', 'Sci-Fi', 'Ação', 'Drama']
                  .map((String value) {
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
            _buildMovieSection('Ação', filteredMovies),
            _buildMovieSection('Drama', filteredMovies),
            _buildMovieSection('Comédia', filteredMovies),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieSection(String genre, List<Movie> movies) {
    print('movies $genre: $movies');
    
    final List<Movie> genreMovies =
        movies.where((movie) => movie.genre == genre).toList();

    return Visibility(
      visible: selectedGenre == 'Todos' || selectedGenre == genre,
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Text(
              genre,
              style: TextStyle(fontSize: 30),
            ),
            if (genreMovies.isNotEmpty)
              MovieCarousel(movies: genreMovies)
            else
              const Text('Nenhum filme encontrado'),
          ],
        ),
      ),
    );
  }
}
