// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../gen/assets.gen.dart';

import 'package:ui_haptics_flutter/ui_haptics_flutter.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidget(context),
      floatingActionButton: null,
    );
  }

  Widget homeWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.images.touch1024.image(),
            ),
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'Heavy Impact',
            hapticFeedback: HapticFeedbackEnum.heavyImpact,
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'Light Impact',
            hapticFeedback: HapticFeedbackEnum.lightImpact,
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'Medium Impact',
            hapticFeedback: HapticFeedbackEnum.mediumImpact,
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'Selection Click',
            hapticFeedback: HapticFeedbackEnum.selectionClick,
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'Selection Vibrate',
            hapticFeedback: HapticFeedbackEnum.selectionVibrate,
          ),
          const Gap(5.0),
          const FeedbackWidget(
            caption: 'None',
            hapticFeedback: HapticFeedbackEnum.none,
          ),
        ],
      ),
    );
  }
}

/// A widget that provides haptic feedback when tapped.
class FeedbackWidget extends StatefulWidget {
  final String caption;
  final HapticFeedbackEnum hapticFeedback;
  const FeedbackWidget({
    super.key,
    required this.caption,
    required this.hapticFeedback,
  });

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) async {
        await widget.hapticFeedback.haptic;
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.blue.withOpacity(0.5) : Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.caption,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
