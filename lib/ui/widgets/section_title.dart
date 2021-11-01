import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

import 'custom_app_bar.dart';

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
            fontSize: SizeConfig.width(18),
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
