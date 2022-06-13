import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconLogin extends StatelessWidget {
  String? image;
  SocialIconLogin({
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: SvgPicture.asset(
        image!,
        color: Colors.green,
        width: 30,
      ),
    );
  }
}
