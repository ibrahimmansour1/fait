import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locale = ref.watch(localeProvider).currentLocale;
    // final themeMode = ref.watch(themeProvider).themeMode;
    // final primaryColor = ref.watch(themeProvider).primaryColor;

    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'FAIT',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        // themeMode: themeMode,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        // locale: locale,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar'),
        ],
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}
