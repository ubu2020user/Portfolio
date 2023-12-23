
import 'experience_model.dart';

class AboutMeModel {
  final String? description, subTitle, buttonText, url;
  final List<Experience>? experiences;
  final int? iconCodePoint;

  AboutMeModel({
    this.experiences,
    this.description,
    this.subTitle,
    this.iconCodePoint,
    this.url,
    this.buttonText,
  });
}