import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MoviesResult similarMovies);

abstract class GetSimilarMoviesUseCaseProtocol {
  void execute({required int movieId, required Success success, required Failure failure});
}

class GetSimilarMoviesUseCase extends GetSimilarMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetSimilarMoviesUseCase({required this.routes});

  @override
  void execute({required int movieId, required Success success, required Failure failure}) {
    routes.getSimilarMovies(
      movieId: movieId,
      success: (results) {
        try {
          final similarMovies = MoviesResult.fromMap(results);
          success(similarMovies);
        } on Error catch (error) {
          failure(error.internalError());
        }
      },
      failure: (dioError) {
        failure(dioError.asServerError());
      },
    );
  }
}
