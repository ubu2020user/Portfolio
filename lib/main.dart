import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/build_extension.dart';
import 'package:portfolio/utils/provider/preferences_provider.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/widgets/qualification/single_qualification/qualification_model.dart';
import 'package:portfolio/widgets/qualification/qualifications_widget.dart';
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: context.themeData.colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
          child: QualificationsWidget(
        isDescending: true,
        widthQualification: 200,
        marginQualificationStick: 30,
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
      )),
    );
  }
}
