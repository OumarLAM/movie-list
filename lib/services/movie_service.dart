import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/movie.dart';

class MovieService {
  Future<List<Movie>> loadMovies() async {
    final String jsonString = await rootBundle.loadString('lib/data/movies.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    List<Movie> movies = jsonList.map((json) => Movie.fromJson(json)).toList();
    // Sort by IMDB rating in descending order
    movies.sort((a, b) => double.tryParse(b.imdbRating)?.compareTo(double.tryParse(a.imdbRating) ?? 0) ?? 0);
    return movies;
  }
}