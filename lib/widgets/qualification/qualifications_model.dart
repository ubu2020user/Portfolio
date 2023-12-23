
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';

class QualificationsModel {
  final List<Qualification>? workList, educationList;
  final String? subTitle;
  final bool? isDescending, isItemScrollable;

  const QualificationsModel(
      {this.workList, this.educationList, this.subTitle, this.isDescending, this.isItemScrollable  = false});
}