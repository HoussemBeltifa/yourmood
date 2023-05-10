  import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourmood/screens/WebViewScreen.dart';
+import 'package:yourmood/screens/home_screen.dart';

  // class Result extends StatelessWidget {
  //   final int score;
  //   final int questionLength;
  //
  //   Result({required this.score, required this.questionLength});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       backgroundColor: Colors.white,
  //       body: SafeArea(
  //         child: Column(
  //
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }
  class Result extends StatefulWidget {
    final int score;
    final int questionLength;
    Result({required this.score, required this.questionLength});

    @override
    State<Result> createState() => _ResultState();
  }

  class _ResultState extends State<Result> {
    List<Map<String, dynamic>> songs = [
      {
        'title': 'Sad song',
        'url': 'https://www.youtube.com/watch?v=rD3GCc7pIi8',
        'scoreThreshold': 0,
      },
      {
        'title': 'Work Song',
        'url': 'https://www.youtube.com/watch?v=MKZ0OecSgBo',
        'scoreThreshold': 10,
      },
      {
        'title': 'Normal Song',
        'url': 'https://www.youtube.com/watch?v=XajjZa_wvRU',
        'scoreThreshold': 20,
      },
      {
        'title': 'Happy Song',
        'url': 'https://www.youtube.com/watch?v=WsGfLf_odg8',
        'scoreThreshold': 30,
      },
    ];
    @override
    Widget build(BuildContext context) {
      String? songUrl;
      for (var song in songs) {
        if (widget.score >= song['scoreThreshold']) {
          songUrl = song['url'];
        } else {
          break;
        }
      }
      return Stack(
        children: [
          // Background image
          Image.asset(
            'assets/Images/1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Scaffold with content
          Scaffold(
            backgroundColor: Colors.transparent, // Make scaffold background transparent
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Your Score of happyness:\n ${widget.score} out of ${widget.questionLength*4}',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(songUrl!))) {
                          await launchUrl(Uri.parse(songUrl!));
                        } else {
                          // Unable to launch the URL
                          print('Unable to launch $songUrl');
                        }
                      },
                      child: Text('Listen to Recommended Song'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate back to the home screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text('Go Back'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

    }
  }

