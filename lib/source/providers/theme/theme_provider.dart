import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/app_export.dart';
import '../../theme/theme_helper.dart';

final themeNotifierProvider = ChangeNotifierProvider<ThemeHelper>((ref) {
  return ThemeHelper();
});
