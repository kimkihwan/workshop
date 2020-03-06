
import 'package:flutter/rendering.dart';


class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.22727,
      0.77273,
    ],
    colors: [
      Color.fromARGB(255, 53, 208, 186),
      Color.fromARGB(255, 71, 90, 239),
    ],
  );
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(0, 1),
    end: Alignment(1, 1),
    stops: [
      0.13889,
      0.86111,
    ],
    colors: [
      Color.fromARGB(255, 53, 208, 186),
      Color.fromARGB(255, 71, 90, 239),
    ],
  );
}