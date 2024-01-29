import 'package:fait/source/theme/theme_helper.dart';
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
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar'),
        ],
        initialRoute: '/steps_tracker_screen',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
