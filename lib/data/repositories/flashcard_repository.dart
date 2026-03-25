import '../models/flashcard.dart';

class FlashcardRepository {
  final List<Flashcard> _flashcards = [
    Flashcard(
      id: '1',
      question: 'What is the capital of France?',
      answer: 'Paris',
    ),
    Flashcard(id: '2', question: 'What is 2 + 2?', answer: '4'),
    Flashcard(
      id: '3',
      question: 'Who painted the Mona Lisa?',
      answer: 'Leonardo da Vinci',
    ),
  ];

  List<Flashcard> get flashcards => _flashcards;
}
