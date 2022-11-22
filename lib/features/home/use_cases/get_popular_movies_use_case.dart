import '../../../model/movies.dart';
import '../../../api/routes/movies.dart';
import '../../../api/setup/api_provider.dart';

typedef Error = void Function(ServerError error);
typedef Success = void Function(List<Movies> popularMovies);

abstract class GetPopularMoviesUseCaseProtocol {
  void invoke({required Success? success, required Failure? failure});
}

class GetPopularMoviesUseCase extends GetPopularMoviesUseCaseProtocol {
  final MoviesRoutes routes;

  GetPopularMoviesUseCase({required this.routes});

  @override
  void invoke({required Success? success, required Failure? failure}) {
    routes.getPopularMovies(
      success: (response) {},
      failure: (error) {},
    );
  }
}
