import 'package:flutter/material.dart';

class SubText extends StatelessWidget {
  final String text;
  final double? size;
  const SubText(this.text, {super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: size),
    );
  }
}
