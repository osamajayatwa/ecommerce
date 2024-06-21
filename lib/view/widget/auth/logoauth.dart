import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssest.logo,
      height: 170,
    );
  }
}
