import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/widgets/testimonial/testimonial_model.dart';

class TestimonialWidget extends StatelessWidget {
  const TestimonialWidget({super.key, required this.testimonial});

  final Testimonial testimonial;
  final double radius = 30;

  @override
  Widget build(BuildContext context) {
    var iconPerson = Icon(Icons.person, color: context.colorScheme.secondary);

    if (testimonial.isFemale) {
      iconPerson = Icon(Icons.person, color: context.colorScheme.tertiary);
    }

    return Card(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(testimonial.name),
            subtitle: Text(testimonial.designation),
            leading: CircleAvatar(
              backgroundColor: context.colorScheme.primaryContainer,
              radius: radius,
              child: testimonial.href == null
                  ? iconPerson
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Image.network(
                        testimonial.href!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => iconPerson,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              testimonial.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
