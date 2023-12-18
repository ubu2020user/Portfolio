import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';

class CallToActionWidget extends StatelessWidget {
  const CallToActionWidget({
    super.key,
    this.title = "You have a new project?",
    this.description =
        "Let's discuss about your project and make it awesome. Contact me now and get a 30% discount on your new project.",
    this.buttonText = "Contact Me",
    this.onPressed,
  });

  final String title, description, buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.75;
    double height = 300;
    var photoWidth = 250;

    double padding = 32;
    var gradient = LinearGradient(colors: [
      context.colorScheme.primary,
      context.colorScheme.primary.withAlpha(200),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);

    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(gradient: gradient),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
                  child: Container(
                    width: width - photoWidth - padding * 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: context.textTheme.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        space(height: 16),
                        Text(
                          description,
                          maxLines: 3,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        space(height: 16),
                        spacer,
                        Buttons.roundedButton(
                          context,
                          text: buttonText,
                          onPressed: onPressed,
                        ),
                        space(height: 32),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: height,
                  width: photoWidth.toDouble(),
                  child: Image.asset(
                    "assets/avatar/side.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
