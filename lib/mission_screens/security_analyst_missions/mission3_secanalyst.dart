import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import '../../game_main.dart';

class SecAnalystMission3 extends StatefulWidget {
  const SecAnalystMission3({Key? key}) : super(key: key);

  @override
  State<SecAnalystMission3> createState() => _SecAnalystMission3State();
}

class _SecAnalystMission3State extends State<SecAnalystMission3> {
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
      "question": "What is a Distributed Denial of Service (DDoS) attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that overwhelms a system or network with a flood of illegitimate requests, rendering it unavailable to users.",
        "An attack that manipulates user input and executes malicious scripts in a web application."
      ],
      "answer": "An attack that overwhelms a system or network with a flood of illegitimate requests, rendering it unavailable to users."
    },
    {
      "question": "How can DDoS attacks be mitigated?",
      "options": [
        "By implementing intrusion detection systems to monitor network traffic.",
        "By regularly updating software and systems to patch known vulnerabilities.",
        "By using traffic filtering techniques and deploying DDoS mitigation services."
      ],
      "answer": "By using traffic filtering techniques and deploying DDoS mitigation services."
    },
    {
      "question": "What is a SQL injection attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that overwhelms a system's memory by inputting more data than it can handle.",
        "An attack that manipulates user input to execute unauthorized SQL queries on a web application's database."
      ],
      "answer": "An attack that manipulates user input to execute unauthorized SQL queries on a web application's database."
    },
    {
      "question": "How can SQL injection attacks be prevented?",
      "options": [
        "By implementing strong encryption algorithms to protect sensitive data.",
        "By validating and sanitizing user input before using it in SQL queries.",
        "By using secure protocols, such as SSH, for remote database connections."
      ],
      "answer": "By validating and sanitizing user input before using it in SQL queries."
    },
    {
      "question": "What is a cross-site scripting (XSS) attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that overwhelms a system's memory by inputting more data than it can handle.",
        "An attack that injects malicious scripts into a web application, which are then executed by users' browsers."
      ],
      "answer": "An attack that injects malicious scripts into a web application, which are then executed by users' browsers."
    },
    {
      "question": "How can XSS attacks be prevented?",
      "options": [
        "By implementing secure password policies and multi-factor authentication.",
        "By validating and sanitizing user input before displaying it on web pages.",
        "By using firewalls and intrusion detection systems to monitor network traffic."
      ],
      "answer": "By validating and sanitizing user input before displaying it on web pages."
    },
    {
      "question": "What is a privilege escalation attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that grants unauthorized users elevated privileges to access system resources.",
        "An attack that manipulates user input and executes malicious scripts in a web application."
      ],
      "answer": "An attack that grants unauthorized users elevated privileges to access system resources."
    },
    {
      "question": "How can privilege escalation attacks be prevented?",
      "options": [
        "By implementing strong access control mechanisms and regularly reviewing user permissions.",
        "By using secure coding practices and validating user input in web applications.",
        "By encrypting sensitive data at rest and in transit."
      ],
      "answer": "By implementing strong access control mechanisms and regularly reviewing user permissions."
    },
    {
      "question": "What is a zero-day vulnerability?",
      "options": [
        "A vulnerability that has been publicly disclosed but not yet patched by the software vendor.",
        "A vulnerability that has been patched by the software vendor but not yet widely adopted.",
        "A vulnerability that is unknown to the software vendor and does not have a patch available."
      ],
      "answer": "A vulnerability that is unknown to the software vendor and does not have a patch available."
    },
    {
      "question": "How can organizations protect themselves from zero-day vulnerabilities?",
      "options": [
        "By regularly updating software and systems to apply the latest security patches.",
        "By using intrusion detection systems to monitor network traffic for suspicious activity.",
        "By implementing security measures, such as sandboxing, to isolate potentially malicious code."
      ],
      "answer": "By regularly updating software and systems to apply the latest security patches."
    },
    {
      "question": "What is social engineering?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that manipulates users into divulging confidential information or performing actions that compromise security.",
        "An attack that overwhelms a system's memory by inputting more data than it can handle."
      ],
      "answer": "An attack that manipulates users into divulging confidential information or performing actions that compromise security."
    },
    {
      "question": "How can organizations protect themselves from social engineering attacks?",
      "options": [
        "By implementing strong authentication mechanisms, such as biometric authentication.",
        "By providing security awareness training to educate employees about common social engineering techniques.",
        "By using firewalls and intrusion detection systems to monitor network traffic."
      ],
      "answer": "By providing security awareness training to educate employees about common social engineering techniques."
    },
    {
      "question": "What is a privilege escalation attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that grants unauthorized users elevated privileges to access system resources.",
        "An attack that manipulates user input and executes malicious scripts in a web application."
      ],
      "answer": "An attack that grants unauthorized users elevated privileges to access system resources."
    },
    {
      "question": "How can privilege escalation attacks be prevented?",
      "options": [
        "By implementing strong access control mechanisms and regularly reviewing user permissions.",
        "By using secure coding practices and validating user input in web applications.",
        "By encrypting sensitive data at rest and in transit."
      ],
      "answer": "By implementing strong access control mechanisms and regularly reviewing user permissions."
    },
    {
      "question": "What is a buffer overflow attack?",
      "options": [
        "An attack that intercepts network traffic to gather sensitive information.",
        "An attack that overwhelms a system's memory by inputting more data than it can handle.",
        "An attack that manipulates user input to execute unauthorized SQL queries on a web application's database."
      ],
      "answer": "An attack that overwhelms a system's memory by inputting more data than it can handle."
    },
    {
      "question": "How can buffer overflow attacks be prevented?",
      "options": [
        "By implementing secure password policies and multi-factor authentication.",
        "By validating and sanitizing user input before using it in SQL queries.",
        "By using input validation and proper memory management techniques in software development."
      ],
      "answer": "By using input validation and proper memory management techniques in software development."
    }
    // Add more questions here...
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
      message = "Great job, Security Analyst! You did an excellent job!";
    } else if (_score >= 10) {
      message = "Well done, Security Analyst! You did a good job!";
    } else {
      message = "Good effort, Security Analyst! Keep practicing!";
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
              "Welcome To Mission 3, Security Analyst!",
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
