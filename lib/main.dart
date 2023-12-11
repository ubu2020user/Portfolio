import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:portfolio/widgets/qualification/qualifications_widget.dart';
import 'package:portfolio/widgets/testimonial/testimonial_model.dart';
import 'package:portfolio/widgets/testimonial/testimonial_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PreferencesProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future loadData(BuildContext context) async {
    context.providerPreferences.init(await SharedPreferences.getInstance());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Material(child: Center(child: CircularProgressIndicator()));
        }

        return MaterialApp(
          title: 'Flutter Demo',
          theme: PortfolioThemes.themeData(),
          darkTheme: PortfolioThemes.themeData(brightness: Brightness.dark),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.themeData.colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
          child: TestimonialCarouselWidget(
        testimonials: [
          Testimonial(
            name: "Nada",
            designation: "CTO",
            description:
                "As CEO of a company, I am very satisfied with the work of the team. They are very professional and have a great sense of design. I will continue to work with them in the future.",
            isFemale: true,
          ),
          Testimonial(
            name: "Simon",
            designation: "Founder of Ellipso StartUp",
            description:
                "I've been in design for 5 years. I'm very satisfied with the work of the team. They are very professional and have a great sense of design. I will continue to work with them in the future.",
            isFemale: false,
          ),
          Testimonial(
            name: "Daniel",
            designation: "The Fonder",
            description: "Creating great stuff scrr",
          ),
        ],
      )),
    );
  }
}
