import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/models/product_model.dart';
import '../../core/navigation/app_navigator.dart';
import '../../core/navigation/route.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

import '../../locator.dart';

class RecentCard extends StatelessWidget {
  const RecentCard({
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
                      child: Image.asset(
                        product.images[0],
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          height: SizeConfig.width(28),
                          width: SizeConfig.width(28),
                          decoration: BoxDecoration(
                            color: product.isFavourite
                                ? AppColors.kPrimaryColor.withOpacity(0.15)
                                : AppColors.kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/Heart Icon_2.svg',
                            color: product.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
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
