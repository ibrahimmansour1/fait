import 'package:fait/source/views/register/widgets/forget_pass_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomSheetProvider = ChangeNotifierProvider<BottomSheetNotifier>((ref) {
  return BottomSheetNotifier(ref);
});

class BottomSheetNotifier extends ChangeNotifier {
  Ref ref;
  late Widget bottomSheet;
  BottomSheetNotifier(this.ref) {
    bottomSheet = ForgetPassBottomSheet();
  }

  void updateBottomSheet(Widget newBottomSheet) {
    bottomSheet = newBottomSheet;
    notifyListeners();
  }

  void resetBottomSheet() {
    bottomSheet = ForgetPassBottomSheet();
    notifyListeners();
  }
}
