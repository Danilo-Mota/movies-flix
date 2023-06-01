import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetUpcomingMoviesUseCaseProtocol {
  void execute({required Success success, required Failure failure});
}

class GetUpcomingMoviesUseCase extends GetUpcomingMoviesUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetUpcomingMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Failure failure}) {
    routes.getUpcomingMovies(
      success: (results) {
        try {
          final upcomingMovies = MoviesResult.fromMap(results);
          success(upcomingMovies);
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
