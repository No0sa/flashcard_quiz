import 'package:flutter/material.dart';
import '../../data/models/flashcard.dart';
import '../../data/repositories/flashcard_repository.dart';

class FlashcardProvider with ChangeNotifier {
  final FlashcardRepository _repository = FlashcardRepository();
  late List<Flashcard> _flashcards;
  int _currentIndex = 0;
  bool _showAnswer = false;

  FlashcardProvider() {
    _flashcards = List.from(_repository.flashcards);
  }

  List<Flashcard> get flashcards => _flashcards;
  int get currentIndex => _currentIndex;
  bool get showAnswer => _showAnswer;

  Flashcard get currentCard => _flashcards[_currentIndex];

  void nextCard() {
    if (_currentIndex < _flashcards.length - 1) {
      _currentIndex++;
      _showAnswer = false;
      notifyListeners();
    }
  }

  void previousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _showAnswer = false;
      notifyListeners();
    }
  }

  void toggleAnswer() {
    _showAnswer = !_showAnswer;
    notifyListeners();
  }

  void resetFlip() {
    _showAnswer = false;
    notifyListeners();
  }

  void addFlashcard(String question, String answer) {
    _flashcards.add(
      Flashcard(
        id: DateTime.now().toString(),
        question: question,
        answer: answer,
      ),
    );
    notifyListeners();
  }

  void editFlashcard(int index, String question, String answer) {
    _flashcards[index].question = question;
    _flashcards[index].answer = answer;
    notifyListeners();
  }

  void deleteFlashcard(int index) {
    if (_flashcards.length > 1) {
      _flashcards.removeAt(index);
      if (_currentIndex >= _flashcards.length) {
        _currentIndex = _flashcards.length - 1;
      }
      _showAnswer = false;
      notifyListeners();
    }
  }
}
