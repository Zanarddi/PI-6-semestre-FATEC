import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/screens/EulaScreen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:pi_6_semestre/screens/CategoriesScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  // await dbHelper.initializeDataBase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 245, 192),
        primaryColor: const Color.fromARGB(255, 255, 245, 192),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isEulaAccepted = false;

  @override
  void initState() {
    super.initState();
    _checkEulaAcceptance();
  }

  _checkEulaAcceptance() async {
    setState(() async {
      _isEulaAccepted = await DataBaseHelper.instance.checkTerms();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isEulaAccepted) {
      // User has accepted the EULA, navigate to the main screen
      return const CategoriesScreen(parent: 0, title: "Categorias");
    } else {
      // User has not accepted the EULA, show the EULA acceptance screen
      return const EulaScreen();
    }
  }

  void _navigateToCategoriesScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const CategoriesScreen(
          parent: 0,
          title: "Categorias",
        ),
      ),
    );
  }
}
