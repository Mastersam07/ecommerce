import '../widgets/material_indicator.dart';
import '../../utils/colors.dart';

import '../widgets/details_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../core/models/product_model.dart';
import '../widgets/color_dots.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_images.dart';
import '../../utils/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: args.rating),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(20),
        ),
        child: ListView(
          children: [
            ProductImages(product: args),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                                fontSize: SizeConfig.width(18),
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            children: [
                              TextSpan(text: '4.9'),
                              TextSpan(
                                text: ' (120)',
                                style: TextStyle(
                                    fontSize: SizeConfig.width(14),
                                    fontWeight: FontWeight.w100,
                                    color: AppColors.kTextColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: SizeConfig.width(18),
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        children: [
                          TextSpan(text: '\$${args.price} '),
                          TextSpan(
                            text: '\$${args.price + 30}',
                            style: TextStyle(
                                fontSize: SizeConfig.width(14),
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w100,
                                color: AppColors.kTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: AppColors.kTextColor.withOpacity(.2),
                ),
                Column(
                  children: [
                    SizeDots(product: args),
                    SizedBox(
                      height: 15,
                    ),
                    ColorDots(product: args),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TabBar(
                            indicator: MaterialIndicator(
                              color: AppColors.blue,
                              height: 5,
                              topLeftRadius: 8,
                              topRightRadius: 8,
                              horizontalPadding: 50,
                              tabPosition: TabPosition.bottom,
                            ),
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Desciption'),
                              Tab(text: 'Reviews'),
                            ],
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Text(args.description),
                                Text(args.description),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsNavBar(product: args),
    );
  }
}
