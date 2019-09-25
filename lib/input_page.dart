import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_bar.dart';
import 'calculator_brain.dart';
import 'results_page.dart';



enum Gender  { male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  bool maleselected = false;
  bool femaleSelected = false;
  
  Gender selectedGender;

  //  void updateColor(Gender gender){
//     maleselected = gender == Gender.male ? true: femaleSelected = false;
//     femaleSelected = gender == Gender.female ? true: maleselected = false;
//     return;
//  }


      

       
   int height = 180;
   int weight = 67;
   int age = 10;
                       
  maleHandler (){
    setState(() {
      selectedGender =  Gender.male;
    });  
    }
  femaleHandler (){
    setState(() {
      selectedGender =  Gender.female;
    });  
    }
  void incrementWeight(){
    setState(() {
     weight++; 
    });
  }

  void decrementWeight(){
    setState(() {
          weight--; 
    });
  }

 void incrementAge(){
    setState(() {
     age++; 
    });
  }

  void decrementAge(){
    setState(() {
          age--; 

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomAppBar(
    color: kBottomContainerColor,
    child:  GestureDetector(
          onTap:(){
              CalculatorBrain calcu = new CalculatorBrain(weight: weight, height: height);
              String res = calcu.calculateBmi();

              Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage(
                bmiDesc: calcu.getInterpretation(),
                bmiLabel: calcu.getResult(),
                bmiResult: res,
                ) ));
          },
            child: Container(
            child: Center(child: Text('CALCULATE', style: kFooterTextStyle,)), 
            color: kBottomContainerColor,
            height: kBottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 1.0),
            ),
        )
    
    ,
  ),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              Expanded(
                child: Row(
                children: <Widget>[
                  Expanded (
                   child:ReusableCard(
                      handler: maleHandler,
                       color$: selectedGender == Gender.male ? kCardColor: kInactiveCardColor,
                       cardChild: new CardContent(cardIcon: MaleIcon(), cardTitle: "Male",),
                       
                       ),
                   
                   ),
          Expanded (
              child:  ReusableCard(
                  handler: femaleHandler,
                  color$:  selectedGender == Gender.female ? kCardColor: kInactiveCardColor,
                  cardChild: new CardContent(cardIcon: FemaleIcon(), cardTitle: "Female",),
                
                ),
              
          ),
              ],
              ),
              ),
              Expanded(child: ReusableCard(
                color$: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kCardTitleStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                      Text(height.toString(), style: kMidTextStyle),
                      Text('CM',style:kCardTitleStyle)
                    ],
                    ),
                    SliderTheme (
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1255),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                          overlayColor: Color(0x29EB1555)
                      ),
                       child: Slider(             
                        value: height.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: (double newValue){
                          setState(() {
                           height = newValue.toInt(); 
                          });

                        },
                      ),
                    )
                  ],
                ),
                ),
            ),
            Expanded(
                  child: Row(
                  children: <Widget>[
                Expanded (
                child: ReusableCard(
                  color$: kCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text('WEGHT', style: kCardTitleStyle,),
                      Text(weight.toString(), style: kMidTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        RoundIconButtom(
                          icon: FontAwesomeIcons.minus,
                          handler: decrementWeight,

                        ),
                        RoundIconButtom(
                          icon: FontAwesomeIcons.plus,
                          handler: incrementWeight,


                        )
                      ],
                      )

                    ],
                  ),
                  ),
          ),
          Expanded (
                child: ReusableCard(color$: kCardColor,
                cardChild: Column(children: <Widget>[
                  Text('AGE', style: kCardTitleStyle,),
                  Text(age.toString(), style: kMidTextStyle,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        RoundIconButtom(
                          icon: FontAwesomeIcons.minus,
                          handler: decrementAge,

                        ),
                        RoundIconButtom(
                          icon: FontAwesomeIcons.plus,
                          handler: incrementAge,


                        )
                      ],
                      )


                ],),),
          )
                ],
                ),
            ),
      
        ],
        ),
      ),
    );

  }
}


class RoundIconButtom extends StatelessWidget {
  final IconData icon;
  final Function handler;
  RoundIconButtom({@required this.icon, @required this.handler});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: handler,
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width:40.0,height: 40.0),
      
    );
  }
}