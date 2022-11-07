import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  const HeaderText(
    this.text, {
    super.key,
    this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
          ),
    );
  }
}
