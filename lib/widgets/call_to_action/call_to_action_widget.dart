import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals/buttons.dart';
import '../../utils/globals/constants.dart';
import 'package:portfolio/utils/globals/device_type.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import '../../../utils/globals/globals.dart';
import '../../utils/globals/open_url_dialog.dart';
import 'call_to_action_model.dart';

class CallToActionWidget extends StatelessWidget {
  const CallToActionWidget({
    super.key,
    required this.model,
  });

  final CallToActionModel model;

  @override
  Widget build(BuildContext context) {
    double photoWidth = 250;

    var gradient = LinearGradient(colors: [
      context.colorScheme.primary,
      context.colorScheme.primary.withAlpha(200),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);

    return isDeviceTypePhone(context)
        ? _CallToActionPhone(
            isElevated: model.isElevated ?? false,
            photoWidth: photoWidth,
            description: model.description ?? "Description",
            title: model.title ?? "Title",
            buttonText: model.buttonText ?? "Click Me",
            onPressed:
                (model.buttonText != null && model.buttonText!.isNotEmpty)
                    ? () async => await openUrlDialog(context, url: model.url!)
                    : null,
            iconCodePoint: model.iconCodePoint,
            gradient: gradient,
          )
        : _CallToActionTablet(
            isElevated: model.isElevated ?? false,
            photoWidth: photoWidth,
            description: model.description ?? "Description",
            title: model.title ?? "Title",
            buttonText: model.buttonText ?? "Click Me",
            onPressed:
                (model.buttonText != null && model.buttonText!.isNotEmpty)
                    ? () async => await openUrlDialog(context, url: model.url!)
                    : null,
            iconCodePoint: model.iconCodePoint,
            gradient: gradient,
          );
  }
}

class _CallToActionPhone extends StatelessWidget {
  const _CallToActionPhone(
      {super.key,
      required this.isElevated,
      required this.photoWidth,
      required this.description,
      required this.title,
      required this.buttonText,
      this.iconCodePoint,
      required this.onPressed,
      required this.gradient});

  final bool isElevated;
  final double photoWidth;

  final String description, title, buttonText;
  final void Function()? onPressed;

  final LinearGradient gradient;
  final int? iconCodePoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: Constants.tabletRowHeight),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: gradient),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  context.textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            space(height: 16),
            Text(
              description,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
            space(height: 16),
            spacer,
            Buttons.roundedButton(
              context,
              text: buttonText,
              onPressed: onPressed,
              iconCodePoint: iconCodePoint,
            ),
            space(height: 32),
            Container(
              constraints: BoxConstraints(
                maxWidth: photoWidth,
              ),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/avatar/side.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CallToActionTablet extends StatelessWidget {
  const _CallToActionTablet(
      {super.key,
      required this.isElevated,
      required this.photoWidth,
      required this.description,
      required this.title,
      required this.buttonText,
      required this.onPressed,
      this.iconCodePoint,
      required this.gradient});

  final bool isElevated;
  final double photoWidth;

  final String description, title, buttonText;
  final void Function()? onPressed;

  final LinearGradient gradient;

  final int? iconCodePoint;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isElevated ? Constants.elevation : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Constants.tabletRowWidth,
          ),
          width: MediaQuery.of(context).size.width * 0.75,
          height: 300,
          decoration: BoxDecoration(gradient: gradient),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 700 - photoWidth,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7 - photoWidth,
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
                        iconCodePoint: iconCodePoint,
                      ),
                      space(height: 32),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                constraints: BoxConstraints(
                  maxWidth: photoWidth,
                ),
                alignment: Alignment.bottomLeft,
                width: MediaQuery.of(context).size.width * 0.28,
                child: Image.asset(
                  "assets/avatar/side.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
