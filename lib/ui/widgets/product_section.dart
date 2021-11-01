import 'package:flutter/material.dart';
import '../../utils/size_config.dart';

import 'section_title.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    this.title,
    this.hasCountdown = false,
    required this.children,
    Key? key,
  }) : super(key: key);

  final String? title;
  final bool hasCountdown;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(20)),
          child: SectionTitle(
            title: title!,
            isCountdown: hasCountdown,
          ),
        ),
        SizedBox(height: SizeConfig.width(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: children,
          ),
        ),
      ],
    );
  }
}
