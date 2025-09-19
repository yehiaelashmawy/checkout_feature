import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

AppBar buildAppBar({required final String title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset('assets/image/arrow.svg')),
    centerTitle: true,
    title: Text(title, textAlign: TextAlign.center, style: Style.style25),
  );
}
