import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/screens/EulaScreen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:pi_6_semestre/screens/CategoriesScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//Setting SysemUIOverlay
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  await DataBaseHelper.instance.initializeDataBase();
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC Autista',
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
  Future<bool>? _eulaAcceptanceFuture;

  @override
  void initState() {
    super.initState();
    _eulaAcceptanceFuture = DataBaseHelper.instance.checkTerms();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _eulaAcceptanceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Future is still running, show a loading indicator or another
          // appropriate widget while waiting for the result.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Future completed with an error, handle the error here
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == true) {
          // EULA accepted, navigate to the main screen
          return const CategoriesScreen(parent: 0, title: "Categorias");
        } else {
          // EULA not accepted, show the EULA acceptance screen
          return const EulaScreen();
        }
      },
    );
  }
}
