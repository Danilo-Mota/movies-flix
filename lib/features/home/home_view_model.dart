import '../../model/movies.dart';
import 'home_view_controller.dart';
import 'items/home_item_view.dart';
import 'items/home_item_view_model.dart';
import 'use_cases/get_popular_movies_use_case.dart';

class HomeViewModel extends HomeViewControllerProtocol {
  final GetPopularMoviesUseCase useCase;
  List<Movies> movies = [];

  HomeViewModel({required this.useCase});

  @override
  List<HomeItemViewModelProtocol> get popularMovies {
    return movies.map((popularMovie) {
      return HomeItemViewModel(movie: popularMovie);
    }).toList();
  }

  @override
  void getPopularMovies() {
    //Implementar loading
    useCase.execute(
      success: (results) {
        movies = results.moviesResult;
        notifyListeners();
      },
      error: (error) {
        //Implementar erro
      },
    );
  }
}
