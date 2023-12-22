import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Stack(
        children: [
          /*Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: context.colorScheme.secondary,
                width: 20,
                height: 10,
              )),*/
          Align(
            alignment: Alignment.centerLeft,
            child: Card(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: context.colorScheme.primary,
                        ),),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: context.colorScheme.primary,
                          )),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
