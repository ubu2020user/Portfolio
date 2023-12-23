import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals/globals.dart';
import 'package:url_launcher/url_launcher.dart';

Future openUrlDialog(BuildContext context, {required String url}) async {
  await showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) => AlertDialog(
      title: const Text("Warning"),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You are about to open an external link.",
              textAlign: TextAlign.justify,
              style: context.textTheme.bodyMedium,
            ),
            spacer,
            Text(
              "We are not responsible for the content of the link.",
              textAlign: TextAlign.justify,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          child: Text("Continue",
              style: context.textTheme.labelLarge
                  ?.copyWith(color: context.colorScheme.secondary)),
          onPressed: () async {
            try {
              var uri = Uri.parse(url);

              if (!await launchUrl(uri)) {
                debugPrint('Could not launch ${uri.toString()}');
              }
            } catch (e) {
              debugPrint("Could not parse or launch ${url}, $e");
            }
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
