import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/device_type.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
    this.title = "You have a new project?",
    this.description =
        "Let's discuss about your project and make it awesome. Contact me now and get a 30% discount on your new project.",
    this.buttonText = "Contact Me",
    this.isElevated = false,
    this.onPressed,
  });

  final String title, description, buttonText;
  final void Function()? onPressed;
  final bool isElevated;

  @override
  Widget build(BuildContext context) {

    var gradient = LinearGradient(colors: [
      context.colorScheme.primary,
      context.colorScheme.primary.withAlpha(200),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: gradient),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "©️ Daniel",
              style: context.textTheme.bodySmall?.copyWith(color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}

