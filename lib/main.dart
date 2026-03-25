import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/providers/flashcard_provider.dart';
import 'presentation/screens/flashcard_home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashcardProvider()),
      ],
      child: const FlashcardApp(),
    ),
  );
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const FlashcardHomePage(),
    );
  }
}
