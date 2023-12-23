import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals/buttons.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import '../../utils/globals/globals.dart';

void showModalBottomSheetSettings(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Buttons.roundedButton(
                context,
                text: "Third Party Notices",
                iconCodePoint: Icons.info_outline.codePoint,
                isPrimary: false, 
                onPressed: () {
                  showLicensePage(context: context);
                },
              ),
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
