import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/components/check_out_card.dart';

import '../../models/Product.dart';
import '../../size_config.dart';
import 'components/color_dots.dart';
import 'components/custom_app_bar.dart';
import 'components/product_images.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating),
      ),
      body: ListView(
      children: [
        ProductImages(product: agrs.product),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                agrs.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Column(
              children: [
                SizeDots(product: agrs.product),
                SizedBox(
                  height: 15,
                ),
                ColorDots(product: agrs.product),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TabBar(
                          labelColor: Colors.black,
                          tabs: [
                            Tab(text: "Desciption"),
                            Tab(text: "Reviews"),
                          ],
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: TabBarView(
                            children: [
                              Container(
                                child: Text(agrs.product.description),
                              ),
                              Container(
                                child: Text(agrs.product.description),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
      bottomNavigationBar: DetailsNavBar(product: agrs.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
