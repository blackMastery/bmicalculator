import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_bar.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiDesc;
  final String bmiLabel;
  ResultPage({@required this.bmiResult, @required this.bmiDesc, @required this.bmiLabel});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
    color: kBottomContainerColor,
    child: BottomBar(route: '/calculate', btnLabel: "RE-CALCULATE",) ,
  ),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded (
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
              child: Text('Your Result', 
              style: TextStyle(fontSize: 55.0 ),
              ),
              ),
              ),
            ResultCard(bmiResult:bmiResult,bmiDesc: bmiDesc, bmiLabel:bmiLabel),

          ],
        ),
      
    );
  }
}




class ResultCard extends StatelessWidget {
    final String bmiResult;
  final String bmiDesc;
  final String bmiLabel;
  ResultCard({@required this.bmiResult, @required this.bmiDesc, @required this.bmiLabel});

  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
          color: kCardColor,
          
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(bmiLabel, style: TextStyle(fontSize: 20.0, color: Colors.green)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 60.0),
            child: Text(bmiResult,
             style: TextStyle(fontSize: 80.0, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(bmiDesc, 
            style: TextStyle(
              fontSize: 20.0, 
              color: Colors.white
              ),
              ),
          ),
        ],
        ),
        
      );
    
  }
}