# UI Haptics Flutter

A Flutter package to easily incorporate haptic feedback into your Flutter applications.

## Getting Started

To use this package, add `ui_haptics_flutter` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  ui_haptics_flutter:
    git: https://github.com/GitHubStuff/ui_haptics_flutter.git
```

## Usage

Import the package where you need to use it.

```dart
import 'package:ui_haptics_flutter/ui_haptics_flutter.dart';
```

You can then use the HapticFeedbackEnum to trigger various types of haptic feedback. Here are the available options:

- HapticFeedbackEnum.heavyImpact: Triggers a heavy impact haptic feedback.
- HapticFeedbackEnum.lightImpact: Triggers a light impact haptic feedback.
- HapticFeedbackEnum.mediumImpact: Triggers a medium impact haptic feedback.
- HapticFeedbackEnum.selectionClick: Triggers a selection click haptic feedback.
- HapticFeedbackEnum.selectionVibrate: Triggers a selection vibrate haptic feedback.
- HapticFeedbackEnum.none: Does not trigger any haptic feedback.

You can use it like this:

```dart
// Trigger heavy impact haptic feedback
HapticFeedbackEnum.heavyImpact.haptic;
```

```dart
import 'package:flutter/material.dart';
import 'package:ui_haptics_flutter/ui_haptics_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Haptic Feedback Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Trigger light impact haptic feedback
              HapticFeedbackEnum.lightImpact.haptic;
            },
            child: Text('Trigger Haptic Feedback'),
          ),
        ),
      ),
    );
  }
}
```

## Note

This package only provides support for platforms that support haptic feedback. On platforms that don't support haptic feedback, the function calls will be ignored.

### Android

For this to work on Android devices include the following in the ```AndroidManifest.xml```

```xml
<uses-permission android:name="android.permission.VIBRATE" />
```

## Finally

Be kind to each other!
