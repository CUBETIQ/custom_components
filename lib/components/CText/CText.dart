import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final bool softWrap;
  CText(
    this.data, {
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      FlutterI18n.translate(context, data),
      overflow: overflow,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
