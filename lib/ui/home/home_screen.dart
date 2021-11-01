import '../widgets/category_chip.dart';
import '../widgets/flash_card.dart';

import '../../core/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../core/models/category_model.dart';
import '../widgets/discount_banner.dart';
import '../widgets/home_header.dart';
import '../widgets/recent_card.dart';
import '../widgets/product_section.dart';
import '../../utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.height(20)),
              HomeHeader(),
              SizedBox(height: SizeConfig.width(10)),
              DiscountBanner(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(20)),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          categories.length,
                          (index) {
                            return CategoryChip(category: categories[index]);
                          },
                        ),
                        SizedBox(width: SizeConfig.width(20)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.width(20)),
              ProductSection(
                title: 'Flash Sale',
                hasCountdown: true,
                children: [
                  ...List.generate(
                    demoProducts.length,
                    (index) {
                      if (demoProducts[index].isFlash)
                        return FlashCard(product: demoProducts[index]);

                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.width(30)),
              ProductSection(
                title: 'Recently Viewed',
                hasCountdown: false,
                children: [
                  ...List.generate(
                    demoProducts.length,
                    (index) {
                      if (demoProducts[index].isPopular)
                        return RecentCard(product: demoProducts[index]);

                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.width(30)),
            ],
          ),
        ),
      ),
    );
  }
}
