import 'package:flutter/material.dart';
import 'package:portfolio/utils/globals/device_type.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import '../../../utils/globals/globals.dart';
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
  });

  final Qualification qualification;
  final bool isLeft, isLast;
  final bool? isWork;

  DateFormat? dateFormat;

  @override
  Widget build(BuildContext context) {
    dateFormat ??= DateFormat("yyyy");
    double width = isDeviceTypePhone(context) ? MediaQuery.of(context).size.width * 0.7 : 200;
    double marginStick = width / 10;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...switch (isDeviceTypePhone(context)) {
          true => [],
          _ => [
              !isLeft ? SizedBox(width: width, height: 30) : const SizedBox(),
              !isLeft ? Container(width: marginStick) : const SizedBox(),
              !isLeft ? Container(width: marginStick) : const SizedBox(),
              !isLeft ? _CircleStickWidget(isLast: isLast) : const SizedBox(),
            Container(width: marginStick),
            ],
        },
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  isWork == null
                      ? const SizedBox()
                      : Icon(!isWork!
                          ? Icons.school_outlined
                          : Icons.work_outline_outlined),
                  isWork == null ? const SizedBox() : spacer,
                  SizedBox(
                    width: width - (isWork == null ? 0 : 32), // icon size
                    child: Text(
                      qualification.title,
                      style: context.textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              space(height: 1),
              Text(
                qualification.description,
                style: context.textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              spacer,
              spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_month_outlined),
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
        ...(switch (isDeviceTypePhone(context)) {
          true => [
            isLeft ? Container(width: marginStick) : const SizedBox(),
            isLeft ? _CircleStickWidget(isLast: isLast) : const SizedBox(),],
          _ => [
              isLeft ? Container(width: marginStick) : const SizedBox(),
              isLeft ? _CircleStickWidget(isLast: isLast) : const SizedBox(),
              isLeft ? Container(width: marginStick) : const SizedBox(),
              isLeft ? SizedBox(width: width, height: 30) : const SizedBox(),
            ]
        })
      ],
    );
  }
}

class _CircleStickWidget extends StatelessWidget {
  const _CircleStickWidget({super.key, this.isLast = false});

  final bool isLast;

  @override
  Widget build(BuildContext context) {
    double stickHeight = isDeviceTypePhone(context) ? 85 : 70;
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
                ? const SizedBox()
                : Container(
                    width: 0.5,
                    height: stickHeight,
                    color: context.colorScheme.primary,
                  ),
          ],
        )
      ],
    );
  }
}
