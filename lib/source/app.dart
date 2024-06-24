import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'localization/app_localization.dart';
import 'routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const locale = Locale("en");
    // final locale = ref.watch(localeProvider).currentLocale;
    // final themeMode = ref.watch(themeProvider).themeMode;
    // final primaryColor = ref.watch(themeProvider).primaryColor;
    final themeProvider = ref.watch(themeNotifierProvider);

    return ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'FAIT',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            theme: theme,
            themeMode: ThemeMode.light,
            locale: locale,
            navigatorKey: NavigatorService.navigatorKey,
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar'),
            ],
            initialRoute: '/main_onboarding_screen',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
