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
}
