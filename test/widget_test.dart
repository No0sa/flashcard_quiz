// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flashcard_quiz/main.dart';

void main() {
  testWidgets('Flashcard app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlashcardApp());

    // Verify that the app title is displayed
    expect(find.text('Flashcard Quiz'), findsOneWidget);

    // Verify that the first flashcard question is displayed
    expect(find.text('What is the capital of France?'), findsOneWidget);

    // Verify that the Show Answer button exists
    expect(find.text('Show Answer'), findsOneWidget);

    // Verify navigation buttons exist
    expect(find.text('Previous'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Tap the Show Answer button
    await tester.tap(find.text('Show Answer'));
    await tester.pump();

    // Verify that the answer is now displayed
    expect(find.text('Show Question'), findsOneWidget);
    expect(find.text('Answer'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);
  });
}
