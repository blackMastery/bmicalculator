import 'dart:math';
class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBmi (){
   _bmi = weight / pow( height/100,2);
  return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if(_bmi > 25.0){
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }

  }

  
  String getInterpretation(){
       if(_bmi.toInt() > 25.0 ){
      return 'Keeping working out.....';
    } else if (_bmi > 18.5){
      return 'NORMAL GOOD JOB!!!!!!!!!!';
    }else{
      return 'Go Eat....';
    }
  }
}