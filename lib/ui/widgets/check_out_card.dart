import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import 'default_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.width(15),
        horizontal: SizeConfig.width(30),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF172133),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Text(
                  '\$337.15',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.height(20)),
            DefaultButton(
              text: 'Check Out',
              press: () {},
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
