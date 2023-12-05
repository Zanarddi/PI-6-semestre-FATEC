import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/screens/EulaScreen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:pi_6_semestre/screens/CategoriesScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // PARA RODA NO EMULADOR NO COMPUTADOR, DESCOMENTE AS LINHAS 15 e 16 E COMENTE A LINHA 13.
  // PARA RODAR NO CELULAR, DESCOMENTE A LINHA 13 E COMENTE AS LINHAS 15 e 16.

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
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == true) {
          return const CategoriesScreen(parent: 0, title: "Categorias");
        } else {
          return const EulaScreen();
        }
      },
    );
  }
}
