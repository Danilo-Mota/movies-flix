import '../setup/api_provider.dart';
import '../setup/endpoint.dart';

abstract class MoviesRoutesProtocol {
  void getPopularMovies({Success? success, Failure? failure});
  void getTopRatedMovies({Success? success, Failure? failure});
  void getUpcomingMovies({Success? success, Failure? failure});
}

class MoviesRoutes extends MoviesRoutesProtocol {
  final ApiProvider _provider = ApiProvider();

  @override
  void getPopularMovies({Success? success, Failure? failure}) {
    final queryParameters = {'api_key': '3b9fba8b00c40dcb824c888f7e7a7405'};
    final endpoint = Endpoint(path: '/movie/popular', method: 'GET', queryParameters: queryParameters);
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getTopRatedMovies({Success? success, Failure? failure}) {
    final queryParameters = {'api_key': '3b9fba8b00c40dcb824c888f7e7a7405'};
    final endpoint = Endpoint(path: '/movie/top_rated', method: 'GET', queryParameters: queryParameters);
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }

  @override
  void getUpcomingMovies({Success? success, Failure? failure}) {
    final queryParameters = {'api_key': '3b9fba8b00c40dcb824c888f7e7a7405'};
    final endpoint = Endpoint(path: '/movie/upcoming', method: 'GET', queryParameters: queryParameters);
    _provider.request(endpoint: endpoint, success: success, failure: failure);
  }
}
