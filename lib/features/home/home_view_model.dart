import 'home_view_controller.dart';
import 'use_cases/get_popular_movies_use_case.dart';

class HomeViewModel extends HomeViewControllerProtocol {
  final GetPopularMoviesUseCase useCase;

  HomeViewModel({required this.useCase});
}
