import 'package:flutter/material.dart';
import 'business_card.dart';
import 'predictor.dart';
import 'resume.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color.fromARGB(255, 220, 231, 251),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contact_page)),
                Tab(icon: Icon(Icons.description)),
                Tab(icon: Icon(Icons.help)),
              ],
            ),
            title: const Text('Call Me Maybe', style: TextStyle(fontFamily: 'Albert', fontSize: 24)),
          ),
          body: const TabBarView(
            children: [
              BusinessCard(),
              Resume(),
              Predictor(),
            ],
          ),
        ),
      ),
    );
  }
}

