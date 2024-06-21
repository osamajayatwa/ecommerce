import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 1,
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icondata,
          color: active == true ? AppColor.primaryColor : AppColor.grey2,
        ),
        Text(textbutton,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey2,
                fontSize: 14))
      ]),
    );
  }
}
