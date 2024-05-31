import 'package:fait/source/theme/extended_color_schemes.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

class ThemeHelper extends ChangeNotifier {
  final Map<String, ExtendedColorScheme> _supportedColorSchemes = {
    'light': ColorSchemes.primaryColorScheme,
    'dark': ColorSchemes.darkColorScheme,
  };

  String _currentTheme = 'light';

  String get currentTheme => _currentTheme;

  void changeTheme(String newTheme) {
    if (_supportedColorSchemes.containsKey(newTheme)) {
      _currentTheme = newTheme;
      notifyListeners();
    } else {
      throw Exception(
          "$newTheme is not found. Make sure you have added this theme class in JSON.");
    }
  }

  ThemeData getThemeData() {
    var extendedColorScheme =
        _supportedColorSchemes[_currentTheme]?.colorScheme ??
            ColorSchemes.primaryColorScheme.colorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: extendedColorScheme,
      textTheme: TextThemes.textTheme(extendedColorScheme),
      scaffoldBackgroundColor: extendedColorScheme.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: extendedColorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: extendedColorScheme.primary,
            width: 2.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: extendedColorScheme.onPrimary.withOpacity(1),
      ),
    );
  }

  PrimaryColors themeColor() => PrimaryColors();

  ThemeData themeData() => getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(0.5),
          fontSize: 12.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 48.fSize,
          fontFamily: 'Modern No. 20',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 32.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 24.fSize,
          fontFamily: 'Aquire',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 20.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(0.75),
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static var primaryColorScheme = ExtendedColorScheme.light(
    senderMessage: const Color(0XFF8394CA),
    receiverMessage: const Color(0XFFF4F4FC),
    colorScheme: const ColorScheme.light(
      primary: Color(0XFF17D1E0),
      background: Color(0XFFFFFFFF),
      primaryContainer: Color(0XFFFFFFFF),
      errorContainer: Color(0XFF4F67EB),
      onError: Color(0XFF58B8FB),
      onErrorContainer: Color(0XFF121212),
      onPrimary: Color(0XFFFFFFFF),
      onPrimaryContainer: Color.fromARGB(126, 0, 0, 0),
    ),
  );

  static var darkColorScheme = ExtendedColorScheme.dark(
    senderMessage: const Color(0XFF8394CA),
    receiverMessage: const Color(0XFF353767),
    colorScheme: const ColorScheme.dark(
      primary: Color(0XFF17D1E0),
      background: Color(0xFF282B4C),
      primaryContainer: Color(0XFF353767),
      errorContainer: Color(0XFF4F67EB),
      onError: Color(0XFF58B8FB),
      onErrorContainer: Color(0XFF121212),
      onPrimary: Color(0XFF101533),
      onPrimaryContainer: Color(0XFF353767),
    ),
  );
  static Color get senderMessage => primaryColorScheme.senderMessage;
  static Color get receiverMessage => primaryColorScheme.receiverMessage;
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber400 => const Color(0XFFFBC11B);
  Color get amber500 => const Color(0XFFFFC107);
  Color get amber600 => const Color(0XFFE17B08);
  Color get amber700 => const Color(0XFF5e4c41);

  // Black
  Color get black900 => const Color(0XFF000000);

  // Blue
  Color get blue100 => const Color(0XFFC9E7FF);
  Color get blue50 => const Color(0XFFDEEEFF);
  Color get blue500 => const Color(0XFF1F8AFE);
  Color get blue50001 => const Color(0XFF1D88FA);
  Color get blueA400 => const Color(0XFF1877F2);
  Color get blueA40001 => const Color(0XFF1F86FE);
  Color get blueA40002 => const Color(0XFF1F86FB);
  Color get blueA40003 => const Color(0XFF264278);

  // BlueGray
  Color get blueGray100 => const Color(0XFFCAC4D0);
  Color get blueGray10001 => const Color(0XFFD9D9D9);
  Color get blueGray400 => const Color(0XFF7D83A7);
  Color get blueGray40001 => const Color(0XFF77838F);
  Color get blueGray50 => const Color(0XFFEEEFF5);
  Color get blueGray600 => const Color(0XFF4C5A81);
  Color get blueGray800 => const Color(0XFF294350);
  Color get blueGray80001 => const Color(0XFF2B4252);
  Color get blueGray80002 => const Color(0XFF274051);
  Color get blueGray80003 => const Color(0XFF274255);
  Color get blueGray80004 => const Color(0XFF353767);
  Color get blueGray900 => const Color(0XFF282B4C);
  Color get blueGray90001 => const Color(0XFF262444);
  Color get blueGray90002 => const Color(0XFF1E2037);
  Color get blueGray90003 => const Color(0XFF1E2550);
  Color get blueGray90004 => const Color(0XFF2B2930);

  // BlueGrayE
  Color get blueGray900E5 => const Color(0XE52C2A49);

  // Cyan
  Color get cyan200 => const Color(0XFF7FE4F0);
  Color get cyan20001 => const Color(0XFF7EE2EE);
  Color get cyan300 => const Color(0XFF5ED4E2);

  // DeepOrange
  Color get deepOrangeA100 => const Color(0XFFFFA672);

  // DeepOrangeAf
  Color get deepOrangeA1003f => const Color(0X3FFDAC73);

  // DeepPurple
  Color get deepPurple300 => const Color(0XFF8377E6);
  Color get deepPurple400 => const Color(0XFF6F62E1);
  Color get deepPurple40001 => const Color(0XFF7266E3);
  Color get deepPurpleA100 => const Color(0XFFAF91FD);
  Color get deepPurpleA10001 => const Color(0XFFA98BFB);
  Color get deepPurpleA10002 => const Color(0XFF484378);
  Color get deepPurpleA200 => const Color(0XFF9747FF);
  Color get deepPurpleA2000 => const Color(0XFF502596);

  // Gray
  Color get gray => Colors.grey;
  Color get gray100 => const Color(0XFFF5F6FA);
  Color get gray10001 => const Color(0XFFF4F4FC);
  Color get gray10002 => const Color(0XFFF5F6F8);
  Color get gray10003 => const Color(0XFFF7F7F7);
  Color get gray10004 => const Color(0XFFF5F5F7);
  Color get gray300 => const Color(0XFFE6E0E9);
  Color get gray30001 => const Color(0XFFDDDDDD);
  Color get gray30002 => const Color(0XFFE3E3E7);
  Color get gray50 => const Color(0XFFFFF8F8);
  Color get gray5001 => const Color(0XFFF7F8FA);
  Color get gray50011 => const Color(0XFFEBEBF9);
  Color get gray500111 => const Color(0xAAFFFFFF);
  Color get gray900 => const Color(0XFF0F1330);
  Color get gray90001 => const Color(0XFF131B28);
  Color get gray90002 => const Color(0XFF101533);
  Color get gray90003 => const Color(0XFF0F1521);

  // White
  Color get white => Colors.white;

  // Transparent
  Color get transparent => Colors.transparent;

  // Green
  Color get green400 => const Color(0XFF65C466);
  Color get green500 => const Color(0XFF54D14D);
  Color get greenA700 => const Color(0XFF20B15A);

  // Indigo
  Color get indigo300 => const Color(0XFF7C89C8);
  Color get indigo30001 => const Color(0XFF8394CA);
  Color get indigo500 => const Color(0XFF3B4EB3);
  Color get indigo700 => const Color(0XFF2F41A6);
  Color get indigo900 => const Color(0XFF303A72);
  Color get indigoA100 => const Color(0XFF91ABFF);
  Color get indigoA10001 => const Color(0XFF9BABFF);
  Color get indigoA10002 => const Color(0XFF8B80F8);
  Color get indigoA200 => const Color(0XFF5068EC);
  Color get sleepShapeColor => const Color(0XFF2f3154);

  // LightBlue
  Color get lightBlueA200 => const Color(0XFF43CCFF);
  Color get lightBlue400 => const Color(0XFF26B1F7);
  Color get lightBlue300 => const Color(0XFF0184C7);

  // Orange
  Color get orange300 => const Color(0XFFFEC356);
  Color get orange50 => const Color(0XFFFFF4E9);
  Color get orangeA200 => const Color(0XFFF19A39);

  // Purple
  Color get purpleA200 => const Color(0XFFF73EF8);

  // Red
  Color get red100 => const Color(0XFFFFCECC);
  Color get red300 => const Color(0XFFD86C6C);
  Color get red30001 => const Color(0XFFDC6E6D);
  Color get red30002 => const Color(0XFFD1936B);
  Color get red500 => const Color(0XFFFF302F);

  // Teal
  Color get teal400 => const Color(0XFF31BA99);
  Color get teal40001 => const Color(0XFF44A987);
  Color get tealA700 => const Color(0XFF05CA95);
  Color get tealA70001 => const Color(0XFF05C794);

  // Yellowf
  Color get yellow8003f => const Color(0X3FFEB020);

  // Yellow
  Color get yellow900 => const Color(0XFFF57021);

  Color get brown900 => const Color(0xFFC88551);

  // BlueGrayf
  Color get blueGray2007f => const Color(0X7FA5ACC0);

  // BlueGrayb
  Color get blueGray3003b => const Color(0X3B9EA5B8);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
