import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';
import 'package:portfolio/widgets/qualification/education_work_chooser_widget.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:portfolio/widgets/qualification/single_qualification/single_qualification_widget.dart';
import 'package:provider/provider.dart';

class QualificationsWidget extends StatelessWidget {
  const QualificationsWidget({
    super.key,
    required this.workList,
    required this.educationList,
    this.widthQualification = 200,
    this.marginQualificationStick = 20,
    this.isItemScrollable = false,
    this.isDescending = false,
  });

  final List<Qualification> workList, educationList;

  final double widthQualification, marginQualificationStick;

  final bool isItemScrollable, isDescending;

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
      qualificationList = educationList;
    }
    if (isWork) {
      qualificationList = [...qualificationList, ...workList];
    }

    qualificationList.sort((a, b) => isDescending
        ? b.startDate.compareTo(a.startDate)
        : a.startDate.compareTo(b.startDate));

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
            // todo check alpha feature
            var isLeft = (index + 1) % 2 != 0;

            var qualificationWidget = SingleQualificationWidget(
                qualification: qualificationList[index],
                isLeft: isLeft,
                isLast: (index + 1) == qualificationList.length,
                width: widthQualification,
                marginStick: marginQualificationStick,
                isWork: !(isWork && isEducation)
                    ? null
                    : workList.contains(qualificationList[index]));

            if (isLeft || !isItemScrollable) {
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
