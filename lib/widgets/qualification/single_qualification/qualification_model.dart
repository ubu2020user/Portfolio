class Qualification {
  final String title, description;

  final DateTime startDate;
  final DateTime? endDate;

  Qualification(
      {required this.title,
      required this.description,
      required this.startDate,
      this.endDate});
}
