import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';

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
    var photoWidth = 250;

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

    return Column(
      children: [
        CaptionWidget(title: "About Me", subTitle: introduction),
        Container(
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
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ExperienceWidget(experience: experiences[index]),
                          separatorBuilder: (context, index) =>
                              space(width: 70),
                          itemCount: experiences.length),
                    ),
                    Expanded(child: SizedBox()),
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

class Experience {
  final String experience, description;

  Experience({required this.experience, required this.description});
}

/// Experience Widget
/// Experience(experience: "08+", description: "Years of Experience"),
class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key, required this.experience});

  final Experience experience;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.experience.experience,
              style: context.textTheme.titleLarge),
          Text(
            widget.experience.description,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
