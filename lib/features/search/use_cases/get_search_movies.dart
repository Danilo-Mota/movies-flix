import '../../../api/routes/movies_routes.dart';
import '../../../model/movies_result.dart';
import '../../../model/server_error.dart';

typedef Failure = void Function(ServerError failure);
typedef Success = void Function(MoviesResult popularMovies);

abstract class GetSearchMoviesUseCaseProtocol {
  void execute({required String text ,required Success success, required Failure failure});
}

class GetSearchMoviesUseCase extends GetSearchMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetSearchMoviesUseCase({required this.routes});

  @override
  void execute({required String text, required Success success, required Failure failure}) {
    routes.getSearchMovies(
      searchText: text,
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
