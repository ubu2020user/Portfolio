import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/buttons.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/utils/provider/theme_mode_provider.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/widgets/about_me/about_me_widget.dart';
import 'package:portfolio/widgets/call_to_action_widget.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:portfolio/widgets/qualification/qualifications_widget.dart';
import 'package:portfolio/widgets/side_bar_widget.dart';
import 'package:portfolio/widgets/testimonial/testimonial_model.dart';
import 'package:portfolio/widgets/testimonial/testimonial_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  FlutterError.onError = (details) {
    if (kDebugMode) debugPrint("Did not catch ERROR $details");
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) debugPrint("Did not catch PLATFORM ERROR $error $stack");
    return true;
  };

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PreferencesProvider()),
    ChangeNotifierProvider(create: (context) => ThemeModeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String name = "Daniel";

  Future loadData(BuildContext context) async {
    var preferences = await SharedPreferences.getInstance();
    context.providerPreferences.init(preferences);
    context.providerThemeMode.init(preferences);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Material(
              child: Center(child: CircularProgressIndicator()));
        }

        return Consumer<ThemeModeProvider>(
            builder: (context, value, child) =>
                buildOnStateChange(context, value));
      },
    );
  }

  Widget buildOnStateChange(BuildContext context, ThemeModeProvider provider) {
    return MaterialApp(
      title: "$name's Portfolio",
      theme: PortfolioThemes.themeData(),
      darkTheme: PortfolioThemes.themeData(brightness: Brightness.dark),
      themeMode: provider.isDarkMode == null
          ? ThemeMode.system
          : provider.isDarkMode!
              ? ThemeMode.dark
              : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(name: name),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name});

  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.themeData.colorScheme.background,
        title: Row(
          children: [
            Text(widget.name, style: context.textTheme.titleSmall),
            const Expanded(child: SizedBox()),
            Buttons.appBarTextButton(context, text: "Contact Me",
                onPressed: () {
              /*todo confirmation dialog */
            }),
            IconButton(
                onPressed: () => context.providerThemeMode.toggleDarkMode(),
                icon: const Icon(Icons.dark_mode_outlined))
          ],
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: listWidgets.length,
                itemBuilder: (context,
                        index) => /* Not extend everything to screen width */
                    Align(child: listWidgets[index]),
                separatorBuilder: (context, index) => space(height: 90),
              ),
            ),
          ),
          SideBarWidget(),
        ],
      ),
    );
  }

  List<Widget> listWidgets = [
    AboutMeWidget(
      onPressed: () {},
    ),
    QualificationsWidget(
      isDescending: true,
      educationList: [
        Qualification(
          title: "FHD3W Fachhochschule der Wirtschaft",
          description: "Bielefeld - Wirtschaftsinformatik",
          startDate: DateTime(2020),
          endDate: DateTime(2023),
        )
      ],
      workList: [
        Qualification(
          title: "Software Engineer",
          description: "Cologne - Telekom",
          startDate: DateTime(2020),
        ),
        Qualification(
          title: "Nada's Flutter Dev",
          description: "Cologne - Telekom",
          startDate: DateTime(2021),
        )
      ],
    ),
    CallToActionWidget(
      onPressed: () {},
    ),
    TestimonialCarouselWidget(
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
          href:
              "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1229892983-square.jpg",
        ),
        Testimonial(
          name: "Daniel",
          designation: "The Founder",
          description: "Creating great stuff scrr",
          href:
              "https://cdn.vox-cdn.com/thumbor/HEeDWCewhBlypxLbbYbkBfmDc6w=/0x0:1080x718/1200x800/filters:focal(477x288:649x460)/cdn.vox-cdn.com/uploads/chorus_image/image/71263353/300017093_10114630004939621_5854109382330704814_n.0.jpg",
        ),
      ],
    ),
  ];
}
