import 'package:flutter/material.dart';


class GenderSelection extends StatelessWidget {

  final IconData icon;
  final String gender;
  final TextStyle styles;

  GenderSelection({@required this.icon, @required this.gender, this.styles});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: styles
        ),
      ],
    );
  }
}