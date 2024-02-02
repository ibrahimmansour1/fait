import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/utils/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locale = ref.watch(localeProvider).currentLocale;
    // final themeMode = ref.watch(themeProvider).themeMode;
    // final primaryColor = ref.watch(themeProvider).primaryColor;

    return ProviderScope(
      child: MaterialApp(
        title: 'FAIT',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        theme: theme,
        // themeMode: themeMode,
        // locale: locale,
        navigatorKey: NavigatorService.navigatorKey,
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar'),
        ],
        // initialRoute: '/workout_overview_screen',
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
