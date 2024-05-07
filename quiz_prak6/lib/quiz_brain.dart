
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Brazil penghasil kopi terbesar di  dunia', questionAnswer: true),
    Question(questionText: 'Kopi dapat mengubah pria jadi mayat tak berguna', questionAnswer: false),
    Question(questionText: 'Kopi membantu mengurangi berat badan', questionAnswer: true),
    Question(questionText: 'Kopi bisa mencegah pikun', questionAnswer: true),
    Question(questionText: 'Kopi dari kotoran luwak Indonesia menjadi kopi termahal di dunia', questionAnswer: false),
    Question(questionText: 'Menghirup aroma kopi bisa membuat rileks', questionAnswer: true),
    Question(questionText: 'Kopi bisa menjadi karya seni', questionAnswer: true),
    Question(questionText: 'Biji kopi tidak hanya berwarna hitam', questionAnswer: true),
    Question(questionText: 'Kopi adalah buah', questionAnswer: true),
    Question(questionText: 'Sangrai yang berbeda, rasa yang berbeda', questionAnswer: true),
    Question(questionText: 'Kandungan kafein yang bervariasi', questionAnswer: true),
    Question(questionText: 'Kopi luwak sebagai kopi paling mahal di dunia', questionAnswer: false),
    Question(questionText: 'Kopi tumbuh terbaik di daerah dengan iklim subtropis dan tropis', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1 ) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }

  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}

