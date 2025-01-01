import 'package:flutter/material.dart';
import 'package:news_application/theme/application_theme_manger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_application/theme/settings_provider.dart';
import 'package:provider/provider.dart';
import 'features/splash_view/splash_screen.dart';
import 'home/layout_view.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'News App',
      theme: ApplicationThemeManger.theme,
      debugShowCheckedModeBanner: false,
      locale:Locale(provider.currentLanguage),
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LayOutView.routeName: (context) => const LayOutView(),


      },

    );
  }
}

