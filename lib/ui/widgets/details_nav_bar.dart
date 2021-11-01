import '../../core/models/product_model.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quatity_indicator.dart';

class DetailsNavBar extends StatelessWidget {
  const DetailsNavBar({Key? key, required this.product}) : super(key: key);

  final Product product;

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
                NumIndicator(
                  numOfItem: 2,
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.width(8),
                    horizontal: SizeConfig.width(16),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                          fontSize: SizeConfig.width(14),
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      children: [
                        TextSpan(text: '\$${product.price}'),
                        TextSpan(
                          text: '| Buy Now',
                          style: TextStyle(
                              fontSize: SizeConfig.width(14),
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  padding: EdgeInsets.all(SizeConfig.width(3)),
                  height: SizeConfig.width(40),
                  width: SizeConfig.width(40),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                      width: 2.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.bag,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.height(20)),
          ],
        ),
      ),
    );
  }
}
