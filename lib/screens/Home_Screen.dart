import 'dart:html';

import 'package:flutter/material.dart';
import 'package:groceryapp/listdatabase.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  @override
Widget build(BuildContext context){
  return Scaffold(
    appBar:AppBar(
      title:Text('ShoppingList'),
      actions: [
    IconButton(
      icon: Icon(Icons.add),
      onPressed: ()async {
        print('Element inserted ');
        int i= await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName:'Item 2',
        });
      },
    ),
    IconButton(
      icon: Icon(Icons.visibility),
      onPressed: ()async {
        print('queried');
        List<Map<String,dynamic>> queryRows =await DatabaseHelper.instance.queryAll();
      },
    ),
  ],),
  body:Row(
  children:<Widget>[
    Expanded(
      child: Text('Item 1', textAlign: TextAlign.left),
    ),
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: () async{
        print('Deleted');
        int rowsaffected=await DatabaseHelper.instance.delete(1);
      },
    ),
  ],
),
  );
}
}