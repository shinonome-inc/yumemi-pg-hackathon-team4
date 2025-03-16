import 'package:flutter/material.dart';

/// BuildContext のExtension。
extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
