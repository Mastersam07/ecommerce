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
    final Product agrs = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.rating),
      ),
      body: ListView(
        children: [
          ProductImages(product: agrs),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(20)),
                child: Text(
                  agrs.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Column(
                children: [
                  SizeDots(product: agrs),
                  SizedBox(
                    height: 15,
                  ),
                  ColorDots(product: agrs),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width(20)),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TabBar(
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
                              children: [
                                Text(agrs.description),
                                Text(agrs.description),
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
      bottomNavigationBar: DetailsNavBar(product: agrs),
    );
  }
}
