import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';

import 'experience_model.dart';
import 'experience_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({
    super.key,
    this.description =
        "Web developer, with extensive knowledge and years of experience, working in web technologies and Ui / Ux design, delivering quality work.",
    this.introduction = "FullStack Development Teacher",
    this.buttonText = "Download CV",
    this.onPressed,
  });

  final String description, introduction, buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.75;
    double height = 300;

    double spacerWidth = width / 25; // todo dynamic

    List<Experience> experiences = [
      Experience(experience: "08+", description: "Years of Experience"),
      Experience(experience: "08+", description: "Years of Experience"),
      Experience(experience: "08+", description: "Years of Experience"),
    ];

    double padding = 32;
    var gradient = LinearGradient(colors: [
      context.colorScheme.primary,
      context.colorScheme.primary.withAlpha(200),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);

    var experiencesList = experiences
        .expand((element) => [
              const Expanded(
                  child: SizedBox(
                width: 6,
              )),
              ExperienceWidget(experience: element)
            ])
        .toList()
      ..removeAt(0);

    return Column(
      children: [
        CaptionWidget(title: "About Me", subTitle: introduction),
        SizedBox(
          width: width,
          height: height,
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: height,
                width: width / 2 - padding,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/avatar/straight.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                alignment: Alignment.centerLeft,
                height: height,
                width: width / 2 - padding,
                child: Column(
                  children: [
                    Text(
                      description,
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Row(children: experiencesList),
                    ),
                    const Expanded(child: SizedBox()),
                    Buttons.roundedButton(
                      context,
                      text: buttonText,
                      onPressed: onPressed,
                      color: context.colorScheme.onPrimary,
                      backgroundColor: context.colorScheme.primary,
                      iconData: Icons.file_download_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
