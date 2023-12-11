import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/widgets/others/caption_widget.dart';
import 'package:portfolio/widgets/testimonial/testimonial_model.dart';
import 'package:portfolio/widgets/testimonial/testimonial_widget.dart';

class TestimonialCarouselWidget extends StatelessWidget {
  const TestimonialCarouselWidget({super.key, required this.testimonials});

  final List<Testimonial> testimonials;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CaptionWidget(
          title: 'Testimonial',
          subTitle: 'My client saying',
        ),
        FlutterCarousel(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            slideIndicator: CircularSlideIndicator(
              indicatorRadius: 4,
              itemSpacing: 11,
              alignment: Alignment.bottomCenter,
              currentIndicatorColor: context.colorScheme.primary,
              indicatorBackgroundColor: context.colorScheme.primaryContainer,
            ),
            showIndicator: true,
          ),
          items: testimonials
              .map((t) => TestimonialWidget(testimonial: t))
              .toList(),
        ),
      ],
    );
  }
}
