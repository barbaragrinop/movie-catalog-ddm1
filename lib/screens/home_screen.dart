import 'package:flutter/material.dart';
import 'package:movie_catalog/models/movie.dart';
import 'package:movie_catalog/widgets/movies_pageview.dart';

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
      imageUrl: "https://m.media-amazon.com/images/I/71SBgi0X2KL._AC_UF894,1000_QL80_.jpg",
    ),
    Movie(
      title: "The Dark Knight",
      synopsis: "The Joker wreaks havoc...",
      cast: "Christian Bale, Heath Ledger, Aaron Eckhart",
      year: 2008,
      genre: "Ação",
      imageUrl: "https://upload.wikimedia.org/wikipedia/pt/2/26/DarkKnightTrilha.jpg",
    ),
    Movie(
      title: "The Shawshank Redemption",
      synopsis: "Two imprisoned...",
      cast: "Tim Robbins, Morgan Freeman, Bob Gunton",
      year: 1994,
      genre: "Drama",
      imageUrl: "https://i.ebayimg.com/images/g/h3MAAOSwgotghuOw/s-l1600.jpg",
    ),
    Movie(
      title: "The Matrix",
      synopsis: "A computer hacker...",
      cast: "Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss",
      year: 1999,
      genre: "Sci-Fi",
      imageUrl: "https://upload.wikimedia.org/wikipedia/pt/c/c1/The_Matrix_Poster.jpg",
    ),
    Movie(
      title: "The Godfather",
      synopsis: "The aging patriarch...",
      cast: "Marlon Brando, Al Pacino, James Caan",
      year: 1972,
      genre: "Drama",
      imageUrl: "https://miro.medium.com/v2/resize:fit:1000/1*Nxaz2PmGHZYJv0gIcBOOWg.jpeg",
    ),
    Movie(
      title: "The Lord of the Rings: The Return of the King",
      synopsis: "Gandalf and Aragorn...",
      cast: "Elijah Wood, Viggo Mortensen, Ian McKellen",
      year: 2003,
      genre: "Ação",
      imageUrl: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg",
    ),
    // Add more movies here
  ];

  String selectedGenre = 'Todos';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredMovies = movies.where((movie) {
      return (selectedGenre == 'Todos' || movie.genre == selectedGenre) &&
             (searchQuery.isEmpty || movie.title.toLowerCase().contains(searchQuery.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Filmes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Pesquisar Filme',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
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
            filteredMovies.isNotEmpty 
            ? SizedBox(
              height: MediaQuery.of(context).size.height - 200, // Adjust height as needed
              child: MoviePageView(movies: filteredMovies),
            )
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nenhum filme encontrado!', style: TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }
}
