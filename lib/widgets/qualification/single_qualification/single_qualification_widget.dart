import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:intl/intl.dart';

// TODO Change Colors

class SingleQualificationWidget extends StatelessWidget {
  SingleQualificationWidget({
    super.key,
    required this.qualification,
    this.isLeft = true,
    this.isLast = false,
    this.isWork = null,
    this.dateFormat,
    this.width = 200,
    this.marginStick = 20,
  });

  final Qualification qualification;
  final bool isLeft, isLast;
  final bool? isWork;
  final double width, marginStick;

  DateFormat? dateFormat;

  @override
  Widget build(BuildContext context) {
    dateFormat ??= DateFormat("yyyy");

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isLeft ? Container(width: width, height: 30) : SizedBox(),
        !isLeft ? Container(width: marginStick) : SizedBox(),
        !isLeft ? Container(width: marginStick) : SizedBox(),
        !isLeft ? _CircleStickWidget(isLast: isLast) : SizedBox(),
        Container(width: marginStick),
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  isWork == null
                      ? SizedBox()
                      : Icon(!isWork!
                          ? Icons.school_outlined
                          : Icons.work_outline_outlined),
                  isWork == null ? SizedBox() : spacer,
                  Container(
                    width: width - (isWork == null ? 0 : 32), // icon size
                    child: Text(
                      qualification.title,
                      style: context.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
                  RichText(
                    text: TextSpan(
                      style: context.textTheme.bodyMedium,
                      text: "${dateFormat!.format(qualification.startDate)}",
                      children: [
                        TextSpan(
                            text: qualification.endDate == null ? "+" : " - "),
                        TextSpan(
                            text: qualification.endDate == null
                                ? null
                                : "${dateFormat!.format(qualification.endDate!)}"),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
        isLeft ? Container(width: marginStick) : SizedBox(),
        isLeft ? _CircleStickWidget(isLast: isLast) : SizedBox(),
        isLeft ? Container(width: marginStick) : SizedBox(),
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
