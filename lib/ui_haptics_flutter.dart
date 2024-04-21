library ui_haptics_flutter;

import 'package:flutter/services.dart';

enum HapticFeedbackEnum {
  heavyImpact,
  lightImpact,
  mediumImpact,
  none,
  selectionClick,
  selectionVibrate;

  Future<void> get haptic {
    switch (this) {
      case HapticFeedbackEnum.heavyImpact:
        return HapticFeedback.heavyImpact();
      case HapticFeedbackEnum.lightImpact:
        return HapticFeedback.lightImpact();
      case HapticFeedbackEnum.mediumImpact:
        return HapticFeedback.mediumImpact();
      case HapticFeedbackEnum.selectionClick:
        return HapticFeedback.selectionClick();
      case HapticFeedbackEnum.selectionVibrate:
        return HapticFeedback.vibrate();
      case HapticFeedbackEnum.none:
        return Future<void>.value();
    }
  }
}
