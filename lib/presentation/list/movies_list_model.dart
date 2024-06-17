import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:logger/logger.dart';

import '../../domain/model/movie.dart';

class MoviesListModel {
  Future<List<Movie>> fetchPage(int page) async {
    try {
      return await moviesRepo.getUpcomingMovies(limit: 10, page: page);
    } catch (e) {
      log.e('Error when fetching page $page', error: e);
      rethrow;
    }
  }

  final Logger log;
  final MoviesRepository moviesRepo;

  MoviesListModel({required this.log, required this.moviesRepo});
}
