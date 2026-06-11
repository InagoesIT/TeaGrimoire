import 'package:flutter/material.dart';
import 'package:tea_grimoire/core/widgets/custom_app_bar.dart';
import 'core/widgets/custom_nav_bar.dart';
import 'parchment_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tea Grimoire'),
      backgroundColor: Color(0xFF151210),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: ParchmentCard(
                title: 'Discover Tome Secrets',
                body:
                    'Discover the celestial staves, and nature and mysteries.',
              ),
            ),
          ),
          const CustomNavBar(),
        ],
      ),
    );
  }
}
