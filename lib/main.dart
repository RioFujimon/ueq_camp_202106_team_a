import 'package:cordinate_sns_app/screens/home_screen.dart';
import 'package:cordinate_sns_app/screens/select_coordination_for_other_user_screen.dart';
import 'package:cordinate_sns_app/screens/select_my_coordination_screen.dart';
import 'package:cordinate_sns_app/screens/selecting_clothes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';
import 'screens/screen5.dart';
import 'screens/screen6.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      home: NeumorphicTheme(
        theme: NeumorphicThemeData(
          defaultTextColor: Color(0xFF3E3E3E),
          accentColor: Colors.grey.shade100,
          variantColor: Colors.black38,
          depth: 8,
          intensity: 0.65,
        ),
        themeMode: ThemeMode.light,
        child: MyHomePage(
          title: 'Cordinate Application',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Wrap(
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.red,
                heroTag: 'screen1',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen1(),
                      ));
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                  backgroundColor: Colors.blue,
                  heroTag: 'screen2',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen2(),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  heroTag: 'screen3',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen3(),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  heroTag: 'screen4',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen4(),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.pink,
                  heroTag: 'screen5',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen5(),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.black,
                  heroTag: 'screen6',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen6(),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.orange,
                  heroTag: 'screen7',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SelectCoordinationForOtherUserScreen(
                            uid: "E2hYdU6wWddJKbPmCBHYNkSRlpG3",
                          ),
                        ));
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.deepPurple,
                  heroTag: 'screen8',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectingClothesScreen(
                          clothingCategory: "jacket-and-outer",
                        ),
                      ),
                    );
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.lightBlueAccent,
                  heroTag: 'screen9',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectMyCoordinationScreen(
                            uid: "E2hYdU6wWddJKbPmCBHYNkSRlpG3"),
                      ),
                    );
                  }),
              FloatingActionButton(
                  backgroundColor: Colors.greenAccent,
                  heroTag: 'screen10',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
