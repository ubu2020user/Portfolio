import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/globals/device_type.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';
import 'package:portfolio/widgets/qualification/education_work_chooser_widget.dart';
import 'package:portfolio/widgets/qualification/qualifications_model.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:portfolio/widgets/qualification/single_qualification/single_qualification_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/globals/globals.dart';

class QualificationsWidget extends StatelessWidget {
  const QualificationsWidget({
    super.key,
    required this.model,
  });

  final QualificationsModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
        builder: (context, value, child) => buildOnStateChange(context, value));
  }

  Widget buildOnStateChange(
      BuildContext context, PreferencesProvider provider) {
    var isEducation = provider.qualificationPreferences.$1;
    var isWork = provider.qualificationPreferences.$2;

    List<Qualification> qualificationList = [];
    if (isEducation) {
      qualificationList = model.educationList ?? [];
    }
    if (isWork) {
      qualificationList = [...qualificationList, ...model.workList ?? []];
    }

    qualificationList.sort((a, b) => (model.isDescending ?? true)
        ? b.startDate.compareTo(a.startDate)
        : a.startDate.compareTo(b.startDate));

    double widthQualification = 100, marginQualificationStick = 20;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CaptionWidget(
          title: 'Qualification',
          subTitle: 'My personal journey',
        ),
        EducationWorkChooserWidget(),
        space(height: 32),
        ListView.builder(
          itemCount: qualificationList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var isLeft = (index + 1) % 2 != 0;
            if (isDeviceTypePhone(context)) isLeft = true;

            var qualificationWidget = SingleQualificationWidget(
              qualification: qualificationList[index],
              isLeft: isLeft,
              isLast: (index + 1) == qualificationList.length,
              isWork: !(isWork && isEducation)
                  ? null
                  : (model.workList ?? []).contains(qualificationList[index]),
            );

            if (isLeft || !(model.isItemScrollable ?? false)) {
              return qualificationWidget;
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: qualificationWidget,
              );
            }
          },
        ),
      ],
    );
  }
}
