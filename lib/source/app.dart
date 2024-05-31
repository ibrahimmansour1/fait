import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'localization/app_localization.dart';
import 'routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locale = ref.watch(localeProvider).currentLocale;
    // final themeMode = ref.watch(themeProvider).themeMode;
    // final primaryColor = ref.watch(themeProvider).primaryColor;
    final themeProvider = ref.watch(themeNotifierProvider);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'FAIT',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getThemeData(),
          navigatorKey: NavigatorService.navigatorKey,
          localizationsDelegates: const [
            AppLocalizationDelegate(),
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar'),
          ],
          initialRoute: AppRoutes.mainOnboardingScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
