import 'package:flutter/material.dart';
import 'package:pi_6_semestre/screens/CategoriesScreen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen();

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 10),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    // Panel 1
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 252, 237, 160),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/tutorial/tutorial1.jpg",
                          fit: BoxFit.cover, // Ajustar a imagem dentro do card
                        ),
                      ),
                    ),
                    // Panel 2
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 252, 237, 160),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      // color: Colors.transparent,
                      child: Center(
                        child: Image.asset(
                          "assets/images/tutorial/tutorial2.jpg",
                          fit: BoxFit.cover, // Ajustar a imagem dentro do card
                        ),
                      ),
                    ),
                    // Panel 3
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 252, 237, 160),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/tutorial/tutorial3.jpg",
                          fit: BoxFit.cover, // Ajustar a imagem dentro do card
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 239, 50, 32)),
                            onPressed: () async {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CategoriesScreen(
                                      parent: 0, title: "Categorias"),
                                ),
                              );
                            },
                            child: const Text(
                              'Pular',
                              style: TextStyle(
                                  fontSize: 22.0, // Tamanho da fonte do título
                                  fontFamily: 'Khand',
                                  fontWeight:
                                      FontWeight.normal // Negrito do título
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == 0
                                      ? const Color.fromARGB(255, 239, 50, 32)
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == 1
                                      ? const Color.fromARGB(255, 239, 50, 32)
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == 2
                                      ? const Color.fromARGB(255, 239, 50, 32)
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: (_currentPage == 2)
                              ? FilledButton(
                                  style: FilledButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 239, 50, 32)),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CategoriesScreen(
                                                parent: 0, title: "Categorias"),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Concluir',
                                    style: TextStyle(
                                        fontSize:
                                            22.0, // Tamanho da fonte do título
                                        fontFamily: 'Khand',
                                        fontWeight: FontWeight
                                            .normal // Negrito do título
                                        ),
                                  ),
                                )
                              : FilledButton(
                                  style: FilledButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 239, 50, 32)),
                                  onPressed: () => {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease)
                                  },
                                  child: const Text(
                                    'Próximo',
                                    style: TextStyle(
                                        fontSize:
                                            22.0, // Tamanho da fonte do título
                                        fontFamily: 'Khand',
                                        fontWeight: FontWeight
                                            .normal // Negrito do título
                                        ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
