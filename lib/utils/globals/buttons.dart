import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals/themes.dart';

import 'globals.dart';

class Buttons {
  static Widget appBarTextButton(BuildContext context,
          {String text = "Click Me",
          void Function()? onPressed,
          bool isHighlighted = false}) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: isHighlighted
                ? context.colorScheme.primary
                : context.colorScheme.onBackground,
          ),
        ),
      );

  static Widget roundedButton(
    BuildContext context, {
    String text = "Click Me",
    int? iconCodePoint,
    void Function()? onPressed,
    bool isPrimary = false,
  }) {
    var color = context.colorScheme.primary;
    var backgroundColor = context.colorScheme.onPrimary;

    if (isPrimary) {
      color = context.colorScheme.onPrimary;
      backgroundColor = context.colorScheme.primary;
    }

    if (context.providerThemeMode.isDarkMode ?? false) {
      if (isPrimary) {
        color = context.colorScheme.primaryContainer;
        backgroundColor = context.colorScheme.secondary;
      } else {
        color = context.colorScheme.primaryContainer;
        backgroundColor = Colors.white;
      }
    }

    return _roundedButton(
      context,
      text: text,
      iconCodePoint: iconCodePoint,
      onPressed: onPressed,
      color: color,
      backgroundColor: backgroundColor,
    );
  }

  static Widget _roundedButton(
    BuildContext context, {
    String text = "Click Me",
    int? iconCodePoint,
    void Function()? onPressed,
    Color? color,
    Color? backgroundColor,
  }) {
    color ??= context.colorScheme.primary;
    backgroundColor ??= context.colorScheme.onPrimary;

    return TextButton(
      style: TextButton.styleFrom(
        primary: color /* ripple color */,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          spacer,
          Icon(
              IconData(
                iconCodePoint ?? Icons.send_outlined.codePoint,
                fontFamily: Icons.send_outlined.fontFamily!,
                fontPackage: Icons.send_outlined.fontPackage,
                matchTextDirection: Icons.send_outlined.matchTextDirection,
                fontFamilyFallback: const [
                  "MaterialIcons",
                  "CupertinoIcons",
                ],
              ),
              color: color),
        ],
      ),
    );
  }
}
