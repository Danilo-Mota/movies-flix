import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getPopularMovies({Success? success, Failure? failure});
  void getTopRatedMovies({Success? success, Failure? failure});
  void getUpcomingMovies({Success? success, Failure? failure});
  void getSearchMovies({required String searchText, Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPopularMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/popular', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getTopRatedMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/top_rated', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getUpcomingMovies({Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/movie/upcoming', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getSearchMovies({required String searchText, Success? success, Failure? failure}) {
    final endpoint = Endpoint(path: '/search/movie', method: 'GET', queryParameters: {'query' : searchText});
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
