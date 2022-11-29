import 'package:flutter/material.dart';

import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';

typedef Error = void Function(String error);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetPopularMoviesUseCaseProtocol {
  void execute({required Success success, required Error error});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Error error}) {
    routes.getPopularMovies(
      success: (results) {
        final popularMovies = MoviesResult.fromMap(results);
        success(popularMovies);
      },
      failure: (dioError) {
        error(dioError.message);
      },
    );
  }
}
