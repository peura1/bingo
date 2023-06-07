import 'package:bingo/bloc/bingo_provider.dart';
import 'package:bingo/layout/bingo_grid.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BingoProvider().init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bingo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "photos/tausta.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          ListView(
            children: [
              Container(
                height: 50,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Text(
                      'Wappubingo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Täytä neljän tehtävän vaaka- tai pystysuora tai vinottain. Näytä suoritettu bingo järjestäjille ja varaudu todistamaan suorituksesi.",
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: window.physicalSize.height),
                      child: const BingoGrid()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
