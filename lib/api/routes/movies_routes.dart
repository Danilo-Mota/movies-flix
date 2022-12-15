import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getPopularMovies({Success? success, Failure? failure});
  void getTopRatedMovies({Success? success, Failure? failure});
  void getUpcomingMovies({Success? success, Failure? failure});
  void getMovieDetails({required int movieId, Success? success, Failure? failure});
  void getSimilarMovies({required int movieId, Success? success, Failure? failure});
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
  void getMovieDetails({required int movieId, Success? success, Failure? failure}) {
     final endpoint = Endpoint(path: '/movie/$movieId', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getSimilarMovies({required int movieId, Success? success, Failure? failure}) {
     final endpoint = Endpoint(path: '/movie/$movieId/similar', method: 'GET');
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
