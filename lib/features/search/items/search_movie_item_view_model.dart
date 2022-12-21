import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../model/movies.dart';
import '../../../support/utils/constants.dart';
import 'search_movie_item_view.dart';

class SearchMovieItemViewModel extends SearchMovieItemViewModelProtocol {
  final Movies movie;
  final Localization l10n;

  SearchMovieItemViewModel({required this.movie, required this.l10n});

  @override
  String get title => movie.title;

  @override
  String get releaseDate => movie.releaseDate.substring(0, 4);

  @override
  String get rating => movie.rating.toString();

  @override
  String get voteCount => '${l10n.votesLabel} ${movie.voteCount}';

  @override
  String get posterPath => '${Constants.imageBaseURL}${movie.posterPath}';

  @override
  String get popularity => '${l10n.popularityLabel} ${movie.popularity.toStringAsFixed(0)}';
}
