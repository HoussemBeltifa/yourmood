import 'package:flutter/material.dart';
import 'package:yourmood/screens/result_screen.dart';
import 'package:yourmood/screens/sign_in.dart';
import '../constants.dart';
import '../models/test_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int selectedOptionIndex = -1;
  final intOptions = {'good': 4, 'fine': 3, 'medium': 2, 'bad': 0};
  List<Test> _questions = [
    Test(
      id: '10',
      title: 'how was your day ?',
      options: {'good': 4, 'fine': 3, 'medium': 1, 'bad': 0},
    ),
    Test(
      id: '11',
      title: 'are you tired ?',
      options: {'not at all': 4, 'not really': 3, 'a little': 1, 'very': 0},
    ),
    Test(
      id: '12',
      title: 'how much sleep did you get ?',
      options: {'+8 hours': 4, '6-7hours': 3, '5 hours': 1, '-5 hours': 0},
    ),
    Test(
      id: '13',
      title: 'are you stressed ?',
      options: {'not at all': 4, 'not really': 3, 'a little': 1, 'very': 0},
    ),
    Test(
      id: '14',
      title: 'are you feeling irritable or easily frustrated ?',
      options: {'not at all': 4, 'not really': 3, 'a little': 1, 'very': 0},
    ),
    Test(
      id: '15',
      title: 'are you feeling anxious or worried lately ?',
      options: {'not at all': 4, 'not really': 3, 'a little': 1, 'very': 0},
    ),
    Test(
      id: '16',
      title: 'How often do you exercise?',
      options: {'Every day': 4, 'Two or three times a week': 3, ' Once a week': 1, 'Never': 0},
    ),
    Test(
      id: '17',
      title: 'How motivated are you feeling today?',
      options: {'Extremely motivated': 4, 'Very motivated': 3, 'Moderately motivated': 1, 'Not at all motivated': 0},
    ),
    Test(
      id: '18',
      title: 'How confident are you feeling today?',
      options: {'Extremely confident': 4, 'Very confident': 3, 'Moderately confident': 1, 'Not at all confident': 0},
    ),
    Test(
      id: '19',
      title: 'How optimistic are you feeling today?',
      options: {'Extremely optimistic': 4, 'Very optimistic': 3, 'Slightly optimistic': 1, 'Not at all optimistic': 0},
    )
  ];

  int Stat = -1;
  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (builder)=> Result(score: score,questionLength: questionLength)));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
          selectedOptionIndex = -1;
          Stat = 0;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(int value) {
    if (isAlreadySelected) {
      return;
    } else {
      score+=value;
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }


  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      builder: (ctx, snapshot) {
        if (true) {
          if (false) {
          } else if (true) {
            var extractedData = _questions;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                title: const Text('Test your mood'),
                backgroundColor: background,
                shadowColor: Colors.transparent,
                actions: [
                  // Padding(
                  //   padding: const EdgeInsets.all(18.0),
                  //   child: Text(
                  //     'Score: $score',
                  //     style: const TextStyle(fontSize: 18.0),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=> LoginPage())),
                      child: Icon(Icons.logout),
                    ),
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    QuestionWidget(
                      indexAction: index,
                      question: extractedData[index]
                          .title,
                      totalQuestions:
                          extractedData.length,
                    ),
                    const Divider(color: neutral),
                    const SizedBox(height: 25.0),

                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: (){
                          checkAnswerAndUpdate(
                            extractedData[index].options.values.toList()[i]);
                          setState(() {
                            selectedOptionIndex = i;
                          });
                          },
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: selectedOptionIndex == i
                              ? Colors.blue
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () {nextQuestion(extractedData.length);print(index);}
                ,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(stat: index),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
        }

      },
    );
  }
}

