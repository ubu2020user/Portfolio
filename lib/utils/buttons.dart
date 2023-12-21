import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';

class Buttons {
  static Widget appBarTextButton(BuildContext context, {String text = "Click Me", void Function()? onPressed, bool isHighlighted = false}) => TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: isHighlighted ? context.colorScheme.primary : context.colorScheme.onBackground,
          ),
        ),
      );

  static Widget roundedButton(
    BuildContext context, {
    String text = "Click Me",
    IconData iconData = Icons.send_outlined,
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
          Icon(iconData, color: color),
        ],
      ),
    );
  }
}
