import 'localization.dart';

/// The translations for Portuguese (`pt`).
class LocalizationPt extends Localization {
  LocalizationPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Jeraflix - Danilo';

  @override
  String get homeTitle => 'Home';

  @override
  String get searchTitle => 'Buscar';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get popularMoviesLabel => 'Os mais populares';

  @override
  String get upcomingMoviesLabel => 'O que vem por aí';

  @override
  String get topRatedMoviesLabel => 'Aclamados pela crítica';

  @override
  String get learnMoreLabel => 'Saiba mais';

  @override
  String get suggestionsForYouLabel => 'Sugestões para você';

  @override
  String get votesLabel => 'Votos: ';

  @override
  String get popularityLabel => 'Popularidade: ';

  @override
  String get searchMovieLabel => 'Pesquisar filme';

  @override
  String get authorNameLabel => 'Nome do autor';

  @override
  String get synopsisLabel => 'Sinopse';

  @override
  String get similarItemsLabel => 'Itens Similares';

  @override
  String get requestError => 'Aconteceu um erro inesperado com os nossos servidores.';

  @override
  String get timeoutError => 'O tempo de requisição esgotou, tente novamente mais tarde.';

  @override
  String get mappingFailureError => 'Ocorreu um erro na requisição. Estamos trabalhando nisso!';

  @override
  String get multipleAccountsLoggedError => 'Parece que esta conta está sendo utilizada em outro dispositivo. Faça login novamente.';
}
