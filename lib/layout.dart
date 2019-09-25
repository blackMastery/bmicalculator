import 'package:flutter/material.dart';
import 'input_page.dart';


class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  Expanded cardArea () {
    return Expanded (
            flex: 1,
              child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15.0)
              ),
            ),
          ); 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: 
        <Widget>[
          Row(children: <Widget>[
            cardArea(),
            cardArea(),
          ],)

      ],),
      
    );
  }
}