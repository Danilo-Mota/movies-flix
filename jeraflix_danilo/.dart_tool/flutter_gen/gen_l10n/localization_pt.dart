import 'localization.dart';

/// The translations for Portuguese (`pt`).
class LocalizationPt extends Localization {
  LocalizationPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Jeraflix - Danilo';

  @override
  String get home => 'Home';

  @override
  String get search => 'Buscar';

  @override
  String get profile => 'Perfil';
}
