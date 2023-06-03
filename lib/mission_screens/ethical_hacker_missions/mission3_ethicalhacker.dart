import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../game_main.dart';

class EthicalHackerMission3 extends StatefulWidget {
  const EthicalHackerMission3({Key? key}) : super(key: key);

  @override
  State<EthicalHackerMission3> createState() => _EthicalHackerMission3State();
}

class _EthicalHackerMission3State extends State<EthicalHackerMission3> {
  final player = AudioPlayer();

  void playBackgroundMusic() async {
    await player.play(UrlSource('https://audio.jukehost.co.uk/79WHZvEEBVtB8EgiDeegrGm9fUavd8BU'));
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
      'question': 'What is the concept of a zero-day vulnerability in ethical hacking?',
      'options': [
        'A previously unknown software vulnerability that is exploited before a patch is available',
        'Gaining unauthorized access to a user\'s session',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'A previously unknown software vulnerability that is exploited before a patch is available'
    },
    {
      'question': 'What is the purpose of a rootkit in ethical hacking?',
      'options': [
        'A type of malicious software designed to gain privileged access and control over a system',
        'Exploiting vulnerabilities in a database query language to manipulate database content',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'A type of malicious software designed to gain privileged access and control over a system'
    },
    {
      'question': 'What is the concept of steganography in ethical hacking?',
      'options': [
        'Hiding secret information within seemingly innocent files or data',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Manipulating human psychology to trick individuals into revealing confidential information'
      ],
      'answer': 'Hiding secret information within seemingly innocent files or data'
    },
    {
      'question': 'What is the purpose of a buffer overflow attack in ethical hacking?',
      'options': [
        'Exploiting a programming error to overwrite a system\'s memory and execute malicious code',
        'Intercepting and altering communication between two parties without their knowledge',
        'Creating backups of important system files'
      ],
      'answer': 'Exploiting a programming error to overwrite a system\'s memory and execute malicious code'
    },
    {
      'question': 'What is the concept of a man-in-the-middle (MITM) attack in ethical hacking?',
      'options': [
        'Intercepting and altering communication between two parties without their knowledge',
        'Exploiting vulnerabilities in network protocols',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'Intercepting and altering communication between two parties without their knowledge'
    },
    {
      'question': 'What is the purpose of a wireless deauthentication attack in ethical hacking?',
      'options': [
        'Disconnecting targeted devices from a wireless network',
        'Exploiting vulnerabilities in a web application database',
        'Analyzing and understanding the inner workings of a system or software'
      ],
      'answer': 'Disconnecting targeted devices from a wireless network'
    },
    {
      'question': 'What is the concept of session hijacking in ethical hacking?',
      'options': [
        'Taking control of a user\'s active session without their knowledge',
        'Exploiting vulnerabilities in a database query language to manipulate database content',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'Taking control of a user\'s active session without their knowledge'
    },
    {
      'question': 'What is the purpose of a keylogger in ethical hacking?',
      'options': [
        'Recording keystrokes to capture sensitive information, such as passwords',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Gaining unauthorized access to a user\'s session'
      ],
      'answer': 'Recording keystrokes to capture sensitive information, such as passwords'
    },
    {
      'question': 'What is the concept of DNS spoofing in ethical hacking?',
      'options': [
        'Manipulating DNS responses to redirect users to malicious websites',
        'Exploiting vulnerabilities in network protocols',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'Manipulating DNS responses to redirect users to malicious websites'
    },
    {
      'question': 'What is the purpose of a reverse shell in ethical hacking?',
      'options': [
        'Establishing a connection from a compromised system to an attacker-controlled system',
        'Exploiting a programming error to overwrite a system\'s memory and execute malicious code',
        'Intercepting and altering communication between two parties without their knowledge'
      ],
      'answer': 'Establishing a connection from a compromised system to an attacker-controlled system'
    },
    {
      'question': 'What is the concept of a distributed denial-of-service (DDoS) attack in ethical hacking?',
      'options': [
        'Flooding a network or server with a high volume of traffic from multiple sources to make it unavailable',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'Flooding a network or server with a high volume of traffic from multiple sources to make it unavailable'
    },
    {
      'question': 'What is the purpose of a Trojan horse in ethical hacking?',
      'options': [
        'A type of malware disguised as legitimate software to gain unauthorized access or perform malicious actions',
        'Exploiting vulnerabilities in a web application database',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'A type of malware disguised as legitimate software to gain unauthorized access or perform malicious actions'
    },
    {
      'question': 'What is the concept of social engineering in ethical hacking?',
      'options': [
        'Manipulating human psychology to trick individuals into revealing confidential information',
        'Exploiting vulnerabilities in network protocols',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'Manipulating human psychology to trick individuals into revealing confidential information'
    },
    {
      'question': 'What is the purpose of a web shell in ethical hacking?',
      'options': [
        'A malicious script that provides a remote administrative interface to a compromised web server',
        'Exploiting a programming error to overwrite a system\'s memory and execute malicious code',
        'Gaining unauthorized access to a user\'s session'
      ],
      'answer': 'A malicious script that provides a remote administrative interface to a compromised web server'
    },
    {
      'question': 'What is the concept of privilege escalation in ethical hacking?',
      'options': [
        'Gaining higher privileges or access rights than originally intended',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'Gaining higher privileges or access rights than originally intended'
    },
    {
      'question': 'What is the purpose of a cryptographic hash function in ethical hacking?',
      'options': [
        'Generating a fixed-size output from an input of any size to ensure data integrity and verify authenticity',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Creating backups of important system files'
      ],
      'answer': 'Generating a fixed-size output from an input of any size to ensure data integrity and verify authenticity'
    },
    {
      'question': 'What is the concept of a rainbow table in ethical hacking?',
      'options': [
        'A precomputed table of password hashes used to reverse-engineer passwords from their hashes',
        'Exploiting vulnerabilities in network protocols',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'A precomputed table of password hashes used to reverse-engineer passwords from their hashes'
    },
    {
      'question': 'What is the purpose of a virtual private network (VPN) in ethical hacking?',
      'options': [
        'Creating a secure, encrypted connection over a public network to protect sensitive data',
        'Exploiting a programming error to overwrite a system\'s memory and execute malicious code',
        'Intercepting and altering communication between two parties without their knowledge'
      ],
      'answer': 'Creating a secure, encrypted connection over a public network to protect sensitive data'
    },
    {
      'question': 'What is the concept of SQLmap in ethical hacking?',
      'options': [
        'An open-source penetration testing tool that automates the process of detecting and exploiting SQL injection vulnerabilities',
        'Exploiting a programming error to overwrite a system\'s memory',
        'Tricking users into revealing confidential information'
      ],
      'answer': 'An open-source penetration testing tool that automates the process of detecting and exploiting SQL injection vulnerabilities'
    },
    {
      'question': 'What is the purpose of a phishing kit in ethical hacking?',
      'options': [
        'A collection of tools and resources used to create and launch phishing attacks',
        'Exploiting vulnerabilities in a database query language to manipulate database content',
        'Creating clones of a system to distribute network traffic'
      ],
      'answer': 'A collection of tools and resources used to create and launch phishing attacks'
    },
    {
      'question': 'What is the concept of a botnet in ethical hacking?',
      'options': [
        'A network of compromised computers or devices controlled by an attacker',
        'Exploiting a programming error to overwrite a system\'s memory and execute malicious code',
        'Analyzing and understanding the behavior and characteristics of malicious software'
      ],
      'answer': 'A network of compromised computers or devices controlled by an attacker'
    },
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
              "Welcome To Mission 3, Ethical Hacker!",
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