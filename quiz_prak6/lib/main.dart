import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object quizBrain
QuizBrain quizBrain = QuizBrain();

// main Method
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(185, 207, 143, 94),
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 82, 44, 14), // Ubah warna AppBar di sini
        title: const Text('Coffee Quizz',
        style: TextStyle(color: Colors.white),), // Tambahkan judul AppBar di sini
        centerTitle: true, // Menempatkan judul di tengah AppBar
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // array/list untuk menyimpan score, berupa Icon check or close.
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 1;
  int numIncorrect = 0;

  // fungsi mengecek jawaban dari user (parameter userPickedAnswer)
  // ke jawaban dari daftar pertanyaan (list questions/_questionBanks)
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();


    // setState
    setState(() {
      //TODO: Step 4 - menggunakan IF/ELSE untuk cek akhir quiz
      //jika ia, maka ke line berikuntya
      if (quizBrain.isFinished()) {
        //TODO Step 4 Part A - menampilkan alert menggunakan rFlutter_alert
  Alert(
    context: context,
    title: 'Finished',
    desc: 'You\'ve reached the end of the Quiz\n'
        'Correct Answers: $numCorrect\n'
        'Incorrect Answers: $numIncorrect\n'
        'Total Questions: ${quizBrain.getTotalQuestions()}',
    style: AlertStyle(
      backgroundColor: Color.fromARGB(255, 82, 44, 14), // Ubah warna latar belakang
      titleStyle: TextStyle(
        color: Colors.white, // Ubah warna judul
        fontSize: 24.0, // Ubah ukuran font judul
      ),
      descStyle: TextStyle(
        color: Colors.white, // Ubah warna deskripsi
        fontSize: 18.0, // Ubah ukuran font deskripsi
      ),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Ubah bentuk border alert
        side: BorderSide(
          color: Color.fromARGB(255, 124, 65, 19), // Ubah warna border alert
          width: 2.0, // Ubah ketebalan border alert
        ),
      ),
      alertElevation: 10.0, // Ubah elevasi alert
      isCloseButton: false, // Hilangkan tombol close (X)
      isOverlayTapDismiss: false, // Hilangkan kemampuan menutup dengan mengetuk overlay
      overlayColor: Colors.transparent, // Ubah warna overlay
      animationDuration: Duration(milliseconds: 400), // Ubah durasi animasi
    ),
  ).show();

        quizBrain.reset();

        scoreKeeper = []; 
        numCorrect = 1;
        numIncorrect = 0;
      }

//TODO: Step 6 - if not reached the end, ELSE do the answer checking
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.done_outline,
            color: Color.fromARGB(255, 82, 44, 14),
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.dangerous,
            color: Color.fromARGB(184, 31, 14, 1),
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 82, 44, 14),
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 197, 114, 51)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 124, 65, 19)),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}