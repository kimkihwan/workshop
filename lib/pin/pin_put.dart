import 'package:flutter/material.dart';
import 'package:workshop/pin/pin_put_state.dart';

class PinPut extends StatefulWidget {
  PinPut({
    @required this.onSubmit,
    @required this.fieldsCount,
    this.onClear,
    this.spaceBetween = 10.0,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    this.pasteButtonIcon = const Icon(Icons.content_paste, size: 30),
    this.isTextObscure = false,
    this.keyboardType = TextInputType.text,
    this.keyboardAction = TextInputAction.next,
    this.actionButtonsEnabled = true,
    this.unFocusWhen = false,
    this.clearInput = false,
    this.autoFocus = true,
    this.textCapitalization = TextCapitalization.none,
    this.inputDecoration = const InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xFF1F2232),
        counterText: ''),
    this.containerHeight = 50.0,
  }) : assert(fieldsCount > 0);

  final Function onSubmit;
  final Function onClear;
  final int fieldsCount;
  final TextStyle textStyle;

  final bool clearInput;

  /// Space between fields
  final double spaceBetween;

  /// Creates a bundle of the border, labels, icons, and styles
  /// Set counterText value '' in order to remove extra space from bottom of TextFields
  /// Use contentPadding property to manipulate on height
  /// For example: if contentPadding = 0 height will bee minimum. Note tah width will be always max
  final TextCapitalization textCapitalization;
  final InputDecoration inputDecoration;
  final bool isTextObscure;
  final bool actionButtonsEnabled;
  final TextInputType keyboardType;
  final TextInputAction keyboardAction;
  final bool autoFocus;
  final bool unFocusWhen;
  final Icon pasteButtonIcon;
  final double containerHeight;

  @override
  PinPutState createState() => PinPutState();
}
