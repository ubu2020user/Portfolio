import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';

class QualificationsWidget extends StatefulWidget {
  const QualificationsWidget(
      {super.key, required this.workList, required this.educationList});

  final List<Qualification> workList, educationList;

  @override
  State<QualificationsWidget> createState() => _QualificationsWidgetState();
}

class _QualificationsWidgetState extends State<QualificationsWidget> {
  bool _isEducation = true;
  bool _isWork = false;

  @override
  Widget build(BuildContext context) {
    List<Qualification> qualificationList = [];
    if (_isEducation) {
      qualificationList = widget.educationList;
    }
    if (_isWork) {
      qualificationList = [...qualificationList, ...widget.workList];
    }

    // TODO
    // qualificationList.sort((a, b) => ,)

    return SingleChildScrollView(
      // TODO remove
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Qualification',
            style: context.textTheme.headlineLarge?.copyWith(),
          ),
          space(height: 3),
          Text(
            'My personal journey',
            style: context.textTheme.bodyMedium,
          ),
          spacer,
          spacer,
          spacer,
          spacer,
          spacer,
          spacer,
          spacer,
          EducationWorkChooser(
            onChange: (isEducation, isWork) {
              setState(() {
                _isEducation = isEducation;
                _isWork = isWork;
              });
            },
          ),
          spacer,
          spacer,
          spacer,
          spacer,
          ListView.builder(
            itemCount: qualificationList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return QualificationWidget(
                qualification: qualificationList[index],
                isLeft: (index + 1) % 2 != 0,
                isLast: (index + 1) == qualificationList.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

class EducationWorkChooser extends StatefulWidget {
  EducationWorkChooser({super.key, this.onChange});

  late Function(bool isEducation, bool isWork)? onChange;

  @override
  State<EducationWorkChooser> createState() => _EducationWorkChooserState();
}

class _EducationWorkChooserState extends State<EducationWorkChooser> {
  bool _isEducation = true;
  bool _isWork = false;

  @override
  Widget build(BuildContext context) {
    widget.onChange ??= (isEducation, isWork) {};

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilterChip(
          avatar: _isEducation ? null : Icon(Icons.school_outlined),
          label: Text("Education"),
          selected: _isEducation,
          onSelected: (bool value) {
            setState(() {
              if (!_isWork && !value) return;
              _isEducation = value;
            });
            widget.onChange!(_isEducation, _isWork);
          },
        ),
        spacer,
        FilterChip(
          avatar: _isWork ? null : Icon(Icons.work_outline_outlined),
          label: Text("Work"),
          selected: _isWork,
          onSelected: (bool value) {
            setState(() {
              if (!_isEducation && !value) return;
              _isWork = value;
            });
            widget.onChange!(_isEducation, _isWork);
          },
        ),
      ],
    );
  }
}

class Qualification {
  final String title, description, date;

  Qualification(
      {required this.title, required this.description, required this.date});
}

class QualificationWidget extends StatelessWidget {
  const QualificationWidget(
      {super.key,
      required this.qualification,
      this.isLeft = true,
      this.isLast = false});

  final Qualification qualification;
  final bool isLeft, isLast;
  final double width = 200, distance = 20;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isLeft ? Container(width: width, height: 30) : SizedBox(),
        !isLeft ? Container(width: distance) : SizedBox(),
        !isLeft ? Container(width: distance) : SizedBox(),
        !isLeft ? _CircleStickWidget(isLast: isLast) : SizedBox(),
        Container(width: distance),
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                qualification.title,
                style: context.textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              space(height: 1),
              Text(
                qualification.description,
                style: context.textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              spacer,
              spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month_outlined),
                  spacer,
                  Text(
                    qualification.date,
                    style: context.textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
        isLeft ? Container(width: distance) : SizedBox(),
        isLeft ? _CircleStickWidget(isLast: isLast) : SizedBox(),
        isLeft ? Container(width: distance) : SizedBox(),
        isLeft ? Container(width: width, height: 30) : SizedBox(),
      ],
    );
  }
}

class _CircleStickWidget extends StatelessWidget {
  const _CircleStickWidget({super.key, this.isLast = false});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            space(height: 5),
            Container(
              width: 15, // Adjust the size as needed
              height: 15, // Adjust the size as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.primary,
              ),
            ),
            isLast
                ? SizedBox()
                : Container(
                    width: 0.5,
                    height: 70,
                    color: context.colorScheme.primary,
                  ),
          ],
        )
      ],
    );
  }
}
