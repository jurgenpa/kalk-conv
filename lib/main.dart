import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeApp(),);
  }
}
class MyHomeApp extends StatefulWidget
{
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp>
{

  late TextEditingController _value1Controller, _value2Controller;
  late String vastus;

  @override
  void initState() {
    super.initState();
    vastus = "0.00";
    _value1Controller = TextEditingController();
    _value2Controller = TextEditingController();
  }
  Widget _buildValue1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value1Controller,
        decoration: InputDecoration(labelText: 'Sisesta number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildValue2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value2Controller,
        decoration: InputDecoration(labelText: 'Sisesta number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _value1Controller.dispose();
    _value2Controller.dispose();
  }



  void _calcUpdate(String opr) {
    setState(() {
      final double vaartus1 = double.parse(_value1Controller.text);
      final double vaartus2 = double.parse(_value2Controller.text);
      switch(opr){
        case "+" :  {
          vastus = (vaartus1 + vaartus2).toString();
        } break;
        case "-" : {
          vastus = (vaartus1 - vaartus2).toString();
        } break;
        case "*" : {
          vastus = (vaartus1 * vaartus2).toString();
        } break;
        case "/" : {
          vastus = (vaartus1 / vaartus2).toString();
        } break;
        case "^" : {
          vastus = pow (vaartus1, vaartus2).toString();
        } break;
        case "CE" : {
          vastus = '0';
          _value1Controller.clear();
          _value2Controller.clear();
        } break;

      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulaator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Text('Vastus'),
            Align(
                alignment: Alignment.center,
                child: Text("$vastus", style: TextStyle(fontSize: 40, ),)
            ),
            Divider(height: 4, color: Colors.grey, thickness: 5, ),
            _buildValue1TextField(),
            _buildValue2TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {
                  _calcUpdate("+");
                }, child: Text("+")),

                ElevatedButton(onPressed: () {
                  _calcUpdate("-");
                }, child: Text("-")),

                ElevatedButton(onPressed: () {
                  _calcUpdate("*");
                }, child: Text("*", style: TextStyle(fontSize: 20,),)),

                ElevatedButton(onPressed: () {
                  _calcUpdate("/");
                }, child: Text("/", style: TextStyle(fontSize: 20,),)),

                ElevatedButton(onPressed: () {
                  _calcUpdate("^");
                }, child: Text("^", style: TextStyle(fontSize: 20,),)),

                ElevatedButton(onPressed: () {
                  _calcUpdate("CE");
                }, child: Text("CE", style: TextStyle(fontSize: 20,),)),

              ],
            )

          ],
        ),
      ),
    );
  }

}