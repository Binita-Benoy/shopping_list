
import 'package:flutter/material.dart';

import '../screens/Home_Screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomeScreen(),  
        );
  }
}