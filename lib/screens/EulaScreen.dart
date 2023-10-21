import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/GetAssetHelper.dart';
import 'package:pi_6_semestre/screens/TutorialScreen.dart';

class EulaScreen extends StatefulWidget {
  const EulaScreen();

  @override
  State<EulaScreen> createState() => _EulaScreenState();
}

class _EulaScreenState extends State<EulaScreen> {
  bool _isTermsAccepted = false;
  String _terms = "";
  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    final terms = await getTxtAsset('assets/termos.txt');
    setState(() {
      _terms = terms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Leia os termos e aceite para continuar',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, right: 40, bottom: 30, left: 50),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _terms,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Khand',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (value) =>
                        {setState(() => _isTermsAccepted = value!)}),
                const Text(
                  'Li e aceito os termos de uso',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 0, bottom: 20, left: 0),
                  child: ElevatedButton(
                    onPressed: _isTermsAccepted
                        ? () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TutorialScreen()),
                            );
                          }
                        : null,
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Khand',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
