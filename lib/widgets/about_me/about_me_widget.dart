import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/device_type.dart';
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
    List<Experience> experiences = [
      Experience(experience: "08+", description: "Years of Experience"),
      Experience(experience: "08+", description: "Years of Experience"),
      Experience(experience: "08+", description: "Years of Experience"),
    ];

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          CaptionWidget(title: "About Me", subTitle: introduction),
          getDeviceType(context) == DeviceType.Tablet
              ? _AboutMeContentTablet(
                  description: description,
                  buttonText: buttonText,
                  experiencesList: experiencesList,
                  onPressed: onPressed,
                )
              : _AboutMeContentPhone(
                  description: description,
                  buttonText: buttonText,
                  onPressed: onPressed,
                  experiencesList: experiencesList,
                ),
        ],
      ),
    );
  }
}

class _AboutMeContentPhone extends StatelessWidget {
  const _AboutMeContentPhone(
      {super.key,
      required this.description,
      required this.buttonText,
      required this.experiencesList,
      this.onPressed});

  final String description, buttonText;
  final List<Widget> experiencesList;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/avatar/straight.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        space(height: 24),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Text(
            description,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        space(height: 16),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Container(
            height: 80,
            alignment: Alignment.center,
            child: Row(children: experiencesList),
          ),
        ),
        space(height: 32),
        Buttons.roundedButton(
          context,
          onPressed: onPressed,
          text: buttonText,
          color: context.colorScheme.onPrimary,
          backgroundColor: context.colorScheme.primary,
          iconData: Icons.file_download_outlined,
        )
      ],
    );
  }
}

class _AboutMeContentTablet extends StatelessWidget {
  const _AboutMeContentTablet(
      {super.key,
      required this.description,
      required this.buttonText,
      required this.experiencesList,
      this.onPressed});

  final String description, buttonText;
  final List<Widget> experiencesList;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: Constants.tabletRowWidth / 2 - 75,
            maxHeight: Constants.tabletRowHeight,
          ),
          alignment: Alignment.centerRight,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/avatar/straight.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 75,
            maxHeight: 10,
          ),
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        Container(
          constraints: const BoxConstraints(
            maxWidth: Constants.tabletRowWidth / 2 - 75,
            maxHeight: Constants.tabletRowHeight,
          ),
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          //width / 2 - padding,
          child: Column(
            children: [
              Container(
                child: Text(
                  description,
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
              const Expanded(child: SizedBox()),
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
    );
  }
}
