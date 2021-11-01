import '../../core/models/product_model.dart';
import '../../core/navigation/app_navigator.dart';
import '../../core/navigation/route.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.width(20)),
      child: Container(
        padding: EdgeInsets.all(
          SizeConfig.width(8),
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 5,
              color: Colors.white.withOpacity(0.08),
            ),
          ],
        ),
        width: SizeConfig.width(width),
        child: GestureDetector(
          onTap: () => locator<NavigationService>()
              .navigateTo(ProductDetailsView, arguments: product),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.height(30),
                        bottom: SizeConfig.height(10)),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.1),
                        radius: 40,
                        child: Image.asset(
                          product.images[0],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.width(8),
                        vertical: SizeConfig.height(4),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          border: Border.all(
                              color: AppColors.kPrimaryColor.withOpacity(0.6),
                              width: 1)),
                      child: Text(
                        '50% Off',
                        style: TextStyle(
                            color: AppColors.kPrimaryColor.withOpacity(0.6),
                            fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
                // maxLines: 1,
              ),
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: SizeConfig.width(18),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
