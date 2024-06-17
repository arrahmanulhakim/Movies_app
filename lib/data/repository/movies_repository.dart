import 'package:flutter_movies_app/data/network/client/api_client.dart';

import '../../domain/model/movie.dart';
import '../network/network_mapper.dart';

class MoviesRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  MoviesRepository({
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<Movie>> getUpcomingMovies({
    required int limit,
    required int page,
  }) async {
    final upcomingMovies =
        await apiClient.getUpcomingMovies(page: page, limit: limit);
    return networkMapper.toMovies(upcomingMovies.results);
  }
}
