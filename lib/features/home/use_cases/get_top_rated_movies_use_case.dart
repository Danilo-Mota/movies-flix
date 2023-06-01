import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetTopRatedMoviesUseCaseProtocol {
  void execute({required Success success, required Failure failure});
}

class GetTopRatedMoviesUseCase extends GetTopRatedMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetTopRatedMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Failure failure}) {
    routes.getTopRatedMovies(
      success: (results) {
        try {
          final topRatedMovies = MoviesResult.fromMap(results);
          success(topRatedMovies);
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
