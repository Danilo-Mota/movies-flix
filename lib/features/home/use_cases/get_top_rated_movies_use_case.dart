import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';

typedef Error = void Function(String error);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetTopRatedMoviesUseCaseProtocol {
  void execute({required Success success, required Error error});
}

class GetTopRatedMoviesUseCase extends GetTopRatedMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetTopRatedMoviesUseCase({required this.routes});

  @override
  void execute({required Success success, required Error error}) {
    routes.getTopRatedMovies(
      success: (results) {
        final topRatedMovies = MoviesResult.fromMap(results);
        success(topRatedMovies);
      },
      failure: (dioError) {
        error(dioError.message);
      },
    );
  }
}