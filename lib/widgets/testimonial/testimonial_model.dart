class Testimonial {
  final String name, designation, description;
  final String? href;
  final bool isFemale;

  Testimonial({
    required this.name,
    required this.designation,
    required this.description,
    this.isFemale = false,
    this.href,
  });
}
