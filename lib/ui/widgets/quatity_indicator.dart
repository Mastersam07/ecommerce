import '../../utils/size_config.dart';
import 'package:flutter/material.dart';

class NumIndicator extends StatelessWidget {
  const NumIndicator({
    Key? key,
    this.color = Colors.white,
    required this.numOfItem,
  }) : super(key: key);

  final int numOfItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            '$numOfItem',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: SizeConfig.width(8),
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
