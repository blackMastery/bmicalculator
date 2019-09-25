import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaleIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.mars,
      size: 80.0,
    );
  }
}

class FemaleIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.venus,
      size: 80.0,
    );
  }
}