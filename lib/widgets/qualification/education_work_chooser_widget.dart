import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import '../../utils/globals/globals.dart';

// TODO Translation / Languages

class EducationWorkChooserWidget extends StatelessWidget {
  EducationWorkChooserWidget({super.key, this.onChange});

  late Function(bool isEducation, bool isWork)? onChange;

  @override
  Widget build(BuildContext context) {
    onChange ??= (isEducation, isWork) {};

    var isEducation = context.providerPreferences.qualificationPreferences.$1;
    var isWork = context.providerPreferences.qualificationPreferences.$2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterChip(
          avatar: isEducation ? null : Icon(Icons.school_outlined),
          label: Text("Education"),
          selected: isEducation,
          onSelected: (bool value) {
            if (!isWork && !value) return;
            onChange!(isEducation, isWork);

            context.providerPreferences.qualificationPreferences =
                (value, isWork);
          },
        ),
        spacer,
        FilterChip(
          avatar: isWork ? null : Icon(Icons.work_outline_outlined),
          label: Text("Work"),
          selected: isWork,
          onSelected: (bool value) {
            if (!isEducation && !value) return;
            onChange!(isEducation, isWork);
            context.providerPreferences.qualificationPreferences =
                (isEducation, value);
          },
        ),
      ],
    );
  }
}
