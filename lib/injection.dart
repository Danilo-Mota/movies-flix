import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:get_it/get_it.dart';
import 'api/routes/movies_routes.dart';
import 'features/home/home_view_controller.dart';
import 'features/home/home_view_model.dart';
import 'features/home/use_cases/get_popular_movies_use_case.dart';
import 'features/home/use_cases/get_top_rated_movies_use_case.dart';
import 'features/home/use_cases/get_upcoming_movies_use_case.dart';
import 'support/utils/localize.dart';

/// Este trecho está fora do padrão de injeção de dependência para um Spike utilizando Service Locator

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<Localization>(() => Localize.instance.l10n);

  /// Home
  getIt.registerFactory<MoviesRoutesProtocol>(() => MoviesRoutes());
  getIt.registerFactory<GetPopularMoviesUseCaseProtocol>(() => GetPopularMoviesUseCase(routes: getIt.get<MoviesRoutesProtocol>()));
  getIt.registerFactory<GetTopRatedMoviesUseCaseProtocol>(() => GetTopRatedMoviesUseCase(routes: getIt.get<MoviesRoutesProtocol>()));
  getIt.registerFactory<GetUpcomingMoviesUseCaseProtocol>(() => GetUpcomingMoviesUseCase(routes: getIt.get<MoviesRoutesProtocol>()));
  getIt.registerFactory<HomeViewProtocol>(() => HomeViewModel());
}
