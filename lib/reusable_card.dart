import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {

  final Color color$;
  final cardChild;
  final Function handler;

  ReusableCard({@required this.color$, this.cardChild, this.handler});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: handler ,
        child: Container(      
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
        color: color$,
        borderRadius: BorderRadius.circular(15.0),
               
      ),
      child:  cardChild,
       ),
    );
  }
}
      




class CardContent extends StatelessWidget {
 final String cardTitle;
 final Widget cardIcon;

 CardContent({this.cardIcon, this.cardTitle});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        cardIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(cardTitle, style: kCardTitleStyle)
      ],);
  }
}
