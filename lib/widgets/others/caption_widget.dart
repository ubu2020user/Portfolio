import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import '../../utils/globals/globals.dart';

class CaptionWidget extends StatelessWidget {
  const CaptionWidget({super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.textTheme.headlineLarge),
        space(height: 3),
        Text(subTitle, style: context.textTheme.bodyMedium),
        space(height: 48),
      ],
    );
  }
}
