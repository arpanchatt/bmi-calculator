import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  //const RoundIconButton({ Key? key }) : super(key: key);

  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        fixedSize: Size.fromRadius(23.0),
        primary: Color(0xFF8D8E98),
      ),
    );
  }
}
