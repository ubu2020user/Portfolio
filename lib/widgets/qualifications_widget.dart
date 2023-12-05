import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';

class QualificationsWidget extends StatelessWidget {
  const QualificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Qualification',
          style: context.textTheme.headlineLarge,
        ),
        Text(
          'My personal journey',
          style: context.textTheme.bodyMedium,
        ),
        spacer,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Education"),
            spacer,
            Text("Work"),
          ],
        ),
        QualificationWidget(),
      ],
    );
  }
}

class QualificationWidget extends StatelessWidget {
  const QualificationWidget({super.key, this.isLeft = true});

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Computer Engineer",
          style: context.textTheme.titleMedium,
        )
      ],
    );
  }
}
