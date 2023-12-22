import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/device_type.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';

import 'experience_model.dart';

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
              style: isDeviceTypePhone(context) ? context.textTheme.titleMedium : context.textTheme.titleLarge),
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
