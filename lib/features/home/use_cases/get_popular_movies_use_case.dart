import 'package:flutter/material.dart';

import '../../../api/routes/movies.dart';
import '../../../model/movies_result.dart';

typedef Error = void Function(String error);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetPopularMoviesUseCaseProtocol {
  void invoke({required Success success, required Error failure});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void invoke({required Success success, required Error failure}) {
    routes.getPopularMovies(
      success: (results) {
        final popularMovies = MoviesResult.fromMap(results);
        success.call(popularMovies);
      },
      failure: (error) {
        failure.call(error.message);
      },
    );
  }
}
