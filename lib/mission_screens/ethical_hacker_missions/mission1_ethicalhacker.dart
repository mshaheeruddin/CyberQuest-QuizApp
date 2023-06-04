import 'package:cyberquest_isgame/game_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class EthicalHackerMission1 extends StatefulWidget {
  const EthicalHackerMission1({Key? key}) : super(key: key);

  @override
  State<EthicalHackerMission1> createState() => _EthicalHackerMission1State();
}

class _EthicalHackerMission1State extends State<EthicalHackerMission1> {
  final player = AudioPlayer();

  void playBackgroundMusic() async {
    await player.play(UrlSource('https://audio.jukehost.co.uk/79WHZvEEBVtB8EgiDeegrGm9fUavd8BU'));
  }

  void playFailedMusic() async {
    await player.play(UrlSource('https://audio.jukehost.co.uk/UTqzgWnA5875SGvWSxzlTFHkM05jnIub'));
  }

  @override
  void initState() {
    super.initState();
    playBackgroundMusic();
  }

  final int _duration = 20;
  final CountDownController _controller = CountDownController();

  bool _isCountdownStarted = false;
  bool _isQuizFinished = false;
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _resultLabel = '';
  bool _quizCompleted = false; // Flag to track if the quiz was completed before timer stops

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is footprinting in ethical hacking?',
      'options': [
        'Gaining information about a target system or network',
        'Attempting to gain unauthorized access to a system',
        'Intercepting and modifying network traffic'
      ],
      'answer': 'Gaining information about a target system or network'
    },
    {
      'question': 'What is the purpose of a vulnerability assessment?',
      'options': [
        'Identifying and evaluating security vulnerabilities in a system',
        'Exploiting vulnerabilities to gain unauthorized access',
        'Disrupting network traffic'
      ],
      'answer': 'Identifying and evaluating security vulnerabilities in a system'
    },
    {
      'question': 'What is the main goal of penetration testing?',
      'options': [
        'Assessing the security of a system by simulating real-world attacks',
        'Creating new vulnerabilities in a system',
        'Interfering with network communication'
      ],
      'answer': 'Assessing the security of a system by simulating real-world attacks'
    },
    {
      'question': 'What is the concept of social engineering in ethical hacking?',
      'options': [
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Exploiting vulnerabilities in network protocols',
        'Overloading a system with excessive traffic'
      ],
      'answer': 'Manipulating human psychology to trick individuals into revealing confidential information'
    },
    {
      'question': 'What is the purpose of a firewall in network security?',
      'options': [
        'Monitoring and controlling incoming and outgoing network traffic',
        'Encrypting sensitive data to protect it from unauthorized access',
        'Creating backups of important system files'
      ],
      'answer': 'Monitoring and controlling incoming and outgoing network traffic'
    },
    {
      'question': 'What is the difference between white hat hackers and black hat hackers?',
      'options': [
        'White hat hackers are ethical hackers who use their skills for good, while black hat hackers engage in malicious activities',
        'White hat hackers focus on physical security, while black hat hackers focus on digital security',
        'White hat hackers work for the government, while black hat hackers work independently'
      ],
      'answer': 'White hat hackers are ethical hackers who use their skills for good, while black hat hackers engage in malicious activities'
    },
    {
      'question': 'What is the concept of privilege escalation?',
      'options': [
        'Gaining higher levels of access and privileges than initially authorized',
        'Exploiting vulnerabilities in a database query language',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'Gaining higher levels of access and privileges than initially authorized'
    },
    {
      'question': 'What is the purpose of cryptography in ethical hacking?',
      'options': [
        'Protecting sensitive information by converting it into unreadable form',
        'Disrupting network traffic to make it unavailable',
        'Exploiting vulnerabilities in web applications'
      ],
      'answer': 'Protecting sensitive information by converting it into unreadable form'
    },
    {
      'question': 'What is the concept of SQL injection in ethical hacking?',
      'options': [
        'Exploiting vulnerabilities in a database query language to manipulate database operations',
        'Tricking users into revealing confidential information',
        'Intercepting and modifying network traffic'
      ],
      'answer': 'Exploiting vulnerabilities in a database query language to manipulate database operations'
    },
    {
      'question': 'What is the purpose of ethical hacking?',
      'options': [
        'Identifying and fixing vulnerabilities in systems to improve overall security',
        'Disrupting the operations of target systems or networks',
        'Gaining unauthorized access to sensitive information'
      ],
      'answer': 'Identifying and fixing vulnerabilities in systems to improve overall security'
    }
  ];



  void _selectAnswer(String selectedAnswer) {
    if (!_isCountdownStarted) {
      return;
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final correctAnswer = currentQuestion['answer'];

    if (selectedAnswer == correctAnswer) {
      setState(() {
        _score += 5;
        _resultLabel = 'CORRECT!';
      });
    } else {
      setState(() {
        _resultLabel = 'NOT CORRECT';
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _resultLabel = '';
      });
    } else {
      setState(() {
        _isQuizFinished = true;
        _quizCompleted = true; // Set the flag when the quiz is completed
        _showFinalScoreDialog(); // Show the final score dialog
      });
    }
  }

  void _showFinalScoreDialog() {
    String message;

    if (_score >= 15) {
      message = "Great job, Ethical Hacker! You did an excellent job!";
    } else if (_score >= 10) {
      message = "Well done, Ethical Hacker! You did a good job!";
    } else {
      message = "Good effort, Ethical Hacker! Keep practicing!";
      playFailedMusic();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Completed'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            SizedBox(height: 20),
            Text('Final Score: $_score'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MainScreen()));
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.arrowLeft),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 14),
            child: Text(
              "Welcome To Mission 1, Ethical Hacker!",
              style: GoogleFonts.adventPro(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '$_score',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3,
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          if (!_isCountdownStarted) {
                            _controller.start();
                          }
                        },
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          ringColor: Colors.grey[300]!,
                          fillColor: Colors.purpleAccent[100]!,
                          backgroundColor: Colors.purple[500],
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            debugPrint('Countdown Started');
                            setState(() {
                              _isCountdownStarted = true;
                            });
                          },
                          onComplete: () {
                            debugPrint('Countdown Ended');
                            if (!_quizCompleted) {
                              _showFinalScoreDialog();
                            }
                          },
                          onChange: (String timeStamp) {
                            debugPrint('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction: (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Start";
                            } else {
                              return Function.apply(defaultFormatterFunction, [duration]);
                            }
                          },
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _resultLabel,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      _questions[_currentQuestionIndex]['question'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        for (String option in _shuffleOptions(_questions[_currentQuestionIndex]['options']))
                          SizedBox(
                            width: 400,
                            child: ElevatedButton(
                              onPressed: _isCountdownStarted ? () => _selectAnswer(option) : null,
                              child: Text(option),
                            ),
                          ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _random = Random();
  List<String> _shuffleOptions(List<String> options) {
    // Create a copy of the original options list
    List<String> shuffledOptions = List<String>.from(options);

    // Shuffle the options using the Fisher-Yates algorithm
    for (int i = shuffledOptions.length - 1; i > 0; i--) {
      int j = _random.nextInt(i + 1);
      String temp = shuffledOptions[i];
      shuffledOptions[i] = shuffledOptions[j];
      shuffledOptions[j] = temp;
    }

    return shuffledOptions;
  }


}