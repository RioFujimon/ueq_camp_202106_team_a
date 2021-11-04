import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'screens/login_screen.dart';
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
      debugShowCheckedModeBanner: false,
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
          title: 'Coordinect',
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
    return LoginScreen();
  }
}
