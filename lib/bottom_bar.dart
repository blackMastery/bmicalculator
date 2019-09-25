import 'package:flutter/material.dart';
import 'constants.dart';

class BottomBar extends StatelessWidget {
 final String route;
  final String btnLabel;
  BottomBar({this.btnLabel, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap:(){
     Navigator.pushNamed(context,route);
              },
            child: Container(
            child: Center(child: Text(btnLabel, style: kFooterTextStyle,)), 
            // color: kBottomContainerColor,
            height: kBottomContainerHeight,
            width: double.infinity,
            // margin: EdgeInsets.only(top: 30.0),
            ),
        );
  }
} 