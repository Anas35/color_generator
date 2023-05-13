import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Logic class that generate random color and manage state
class ColorGenerator extends ChangeNotifier {
  /// Maximum color value
  static const maxValue = 255;

  final _random = math.Random();

  // Value for _color is initialize using constructor functions,
  // its guarntee this will never throw late initialization errors.
  // ignore: avoid-late-keyword
  late Color _color;

  /// Get current background color
  Color get color => _color;

  /// Default constructor
  ColorGenerator() {
    _color = _generateColor();
  }

  /// Returns a color by randoming assigning value for RGB
  Color _generateColor() {
    final red = _random.nextInt(maxValue);
    final green = _random.nextInt(maxValue);
    final blue = _random.nextInt(maxValue);

    return Color.fromARGB(maxValue, red, green, blue);
  }

  /// Change the current background color to new color,
  /// and notifer the listener to update state.
  void changeColor() {
    _color = _generateColor();
    notifyListeners();
  }
}
