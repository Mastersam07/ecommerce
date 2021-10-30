import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/components/custom_app_bar.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    this.isCountdown = false,
    required this.title,
  }) : super(key: key);

  final String title;
  final bool isCountdown;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        if (isCountdown)
          NumCountdown(
            leadingTxt: 'Ending in  ',
          ),
      ],
    );
  }
}
