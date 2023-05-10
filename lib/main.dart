import 'package:flutter/material.dart';
import 'package:yourmood/db/MongoDb.dart';
import 'package:yourmood/screens/Welcome.dart';
import 'package:yourmood/screens/sign_in.dart';

import 'screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Mng.connect();

  runApp(
    const MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
