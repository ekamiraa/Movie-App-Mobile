import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:study_api/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Populer Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[index].title),
              subtitle: Text(
                'Rating = ' + movies[index].voteAverage.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
