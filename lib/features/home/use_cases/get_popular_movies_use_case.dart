import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';

typedef Failure = void Function(String failure);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetPopularMoviesUseCaseProtocol {
  void execute({required Success success, required Failure failure});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Failure failure}) {
    routes.getPopularMovies(
      success: (results) {
        final popularMovies = MoviesResult.fromMap(results);
        success(popularMovies);
      },
      failure: (dioError) {
        failure(dioError.message);
      },
    );
  }
}
