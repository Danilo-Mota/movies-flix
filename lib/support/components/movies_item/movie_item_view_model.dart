import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../model/movies.dart';
import '../../extensions/date_extensions.dart';
import '../../utils/constants.dart';
import 'movie_item_view.dart';

abstract class MovieItemViewModelDelegate {
  void didTapMovie({required int movieId});
}

class MovieItemViewModel extends MovieItemViewModelProtocol {
  final Movies movie;
  final bool showRating;
  final Localization l10n;
  final MovieItemViewModelDelegate delegate;

  MovieItemViewModel({required this.delegate, required this.l10n, required this.movie, this.showRating = true});

  @override
  String get posterPath => '${Constants.imageBaseURL}${movie.posterPath}';

  @override
  String get title => movie.title;

  @override
  String get rating {
    return '${Constants.theMoviesDatabaseAbbreviation}${movie.rating.toString()}';
  }

  @override
  bool get isRatingVisible => showRating;

  @override
  String get releaseDate => movie.releaseDate.toFormatDate();

  @override
  String get voteCount => '${l10n.votesLabel} ${movie.voteCount}';

  @override
  String get popularity => '${l10n.popularityLabel} ${movie.popularity.toStringAsFixed(0)}';

  @override
  int get movieId => movie.id;

  @override
  void didTapMovie(int movieId) {
    delegate.didTapMovie(movieId: movieId);
  }
}
