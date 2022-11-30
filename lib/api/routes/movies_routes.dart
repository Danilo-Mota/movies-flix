import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getPopularMovies({Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPopularMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/popular', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
