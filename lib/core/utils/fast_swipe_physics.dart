import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FastPageScrollPhysics extends PageScrollPhysics {
  const FastPageScrollPhysics({super.parent});

  @override
  FastPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FastPageScrollPhysics(parent: buildParent(ancestor));
  }

  // Makes swipe VERY sensitive
  @override
  double get dragStartDistanceMotionThreshold => 3.0;

  // Controls how far user must drag (default is ~0.45)
  @override
  double get minFlingDistance => 5.0;

  @override
  double get minFlingVelocity => 50.0;

  @override
  double get maxFlingVelocity => 5000.0;
}
