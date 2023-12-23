import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals/buttons.dart';
import 'package:portfolio/utils/globals/device_type.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals/open_url_dialog.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';

import '../../utils/globals/constants.dart';
import '../../utils/globals/globals.dart';
import 'about_me_model.dart';
import 'experience_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key, required this.model});

  final AboutMeModel model;

  @override
  Widget build(BuildContext context) {
    // List<Experience> experiences = [
    //   Experience(experience: "08+", description: "Years of Experience"),
    //   Experience(experience: "08+", description: "Years of Experience"),
    //   Experience(experience: "08+", description: "Years of Experience"),
    // ];

    var experiencesWidgetList = <Widget>[];
    if (model.experiences != null && model.experiences!.isNotEmpty) {
      experiencesWidgetList = model.experiences!
          .expand((element) => [
                const Expanded(child: SizedBox(width: 6)),
                ExperienceWidget(experience: element)
              ])
          .toList()
        ..removeAt(0);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          CaptionWidget(
              title: "About Me",
              subTitle: model.subTitle ?? "Introduction"),
          getDeviceType(context) == DeviceType.Tablet
              ? _AboutMeContentTablet(
                  model: model,
                  experiencesWidgetList: experiencesWidgetList,
                )
              : _AboutMeContentPhone(
                  model: model,
                  experiencesWidgetList: experiencesWidgetList,
                ),
        ],
      ),
    );
  }
}

class _AboutMeContentPhone extends StatelessWidget {
  const _AboutMeContentPhone({
    super.key,
    required this.model,
    required this.experiencesWidgetList,
  });

  final AboutMeModel model;
  final List<Widget> experiencesWidgetList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
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
            model.description ?? "Description",
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        experiencesWidgetList.isEmpty ? const SizedBox() : space(height: 16),
        experiencesWidgetList.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(children: experiencesWidgetList),
                ),
              ),
        space(height: 32),
        Buttons.roundedButton(
          context,
          onPressed: (model.url == null || model.url!.isEmpty)
              ? null
              : () => openUrlDialog(context,
                  url: model.url ?? "https://duckduckgo.com"),
          text: model.buttonText ?? "Click Me",
          isPrimary: true,
          iconCodePoint: model.iconCodePoint,
        )
      ],
    );
  }
}

class _AboutMeContentTablet extends StatelessWidget {
  const _AboutMeContentTablet({
    super.key,
    required this.model,
    required this.experiencesWidgetList,
  });

  final AboutMeModel model;
  final List<Widget> experiencesWidgetList;

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
                  model.description ?? "Description",
                  style: context.textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
              experiencesWidgetList.isEmpty
                  ? const SizedBox()
                  : Expanded(child: SizedBox()),
              experiencesWidgetList.isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Row(children: experiencesWidgetList),
                    ),
              const Expanded(child: SizedBox()),
              Buttons.roundedButton(
                context,
                text: model.buttonText ?? "Click Me",
                onPressed: () => openUrlDialog(context, url: model.url ?? ""),
                isPrimary: true,
                iconCodePoint: model.iconCodePoint,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
