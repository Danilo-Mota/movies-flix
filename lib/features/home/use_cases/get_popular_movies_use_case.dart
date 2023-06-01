import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetPopularMoviesUseCaseProtocol {
  void execute({required Success success, required Failure failure});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Failure failure}) {
    routes.getPopularMovies(
      success: (results) {
        try {
          final popularMovies = MoviesResult.fromMap(results);
          success(popularMovies);
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
