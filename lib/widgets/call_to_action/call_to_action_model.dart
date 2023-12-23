import 'package:flutter/cupertino.dart';

class CallToActionModel {
  final String? title, description, buttonText, url;
  final bool? isElevated;
  final int? iconCodePoint;

  const CallToActionModel(
      {this.title,
      this.url,
      this.description,
      this.buttonText,
      this.iconCodePoint,
      this.isElevated = false});
}
