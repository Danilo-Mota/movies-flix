import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'router/mobile_router.dart';
import 'support/style/app_theme.dart';
import 'support/utils/localize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: MobileRouter.initialRoute,
      routes: MobileRouter.routes,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    );
  }
}
