import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomChickIcon extends StatelessWidget {
  const CustomChickIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xFFEDEDED),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(child: SvgPicture.asset('assets/image/check.svg')),
        ),
      ),
    );
  }
}
