import '../../../api/routes/movies_routes.dart';
import '../../../model/movie_details.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MovieDetails details);

abstract class GetMovieDetailsUseCaseProtocol {
  void execute({required int movieId, required Success success, required Failure failure});
}

class GetMovieDetailsUseCase extends GetMovieDetailsUseCaseProtocol {
  final MoviesRoutesProtocol routes;

  GetMovieDetailsUseCase({required this.routes});

  @override
  void execute({required int movieId, required Success success, required Failure failure}) {
    routes.getMovieDetails(
      movieId: movieId,
      success: (results) {
        try {
          final details = MovieDetails.fromMap(results);
          success(details);
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
