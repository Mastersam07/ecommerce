import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
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
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8),
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
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(30),
                          bottom: getProportionateScreenHeight(10)),
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
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(28),
                            width: getProportionateScreenWidth(28),
                            decoration: BoxDecoration(
                              color: product.isFavourite
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kSecondaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
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
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
                // maxLines: 1,
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
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

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
//       child: SizedBox(
//         width: getProportionateScreenWidth(width),
//         child: GestureDetector(
//           onTap: () => Navigator.pushNamed(
//             context,
//             DetailsScreen.routeName,
//             arguments: ProductDetailsArguments(product: product),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AspectRatio(
//                 aspectRatio: 1.02,
//                 child: Container(
//                   // padding: EdgeInsets.all(getProportionateScreenWidth(20)),
//                   decoration: BoxDecoration(
//                     color: kSecondaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Hero(
//                           tag: product.id.toString(),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset(product.images[0]),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(50),
//                           onTap: () {},
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               padding: EdgeInsets.all(
//                                   getProportionateScreenWidth(8)),
//                               height: getProportionateScreenWidth(28),
//                               width: getProportionateScreenWidth(28),
//                               decoration: BoxDecoration(
//                                 color: product.isFavourite
//                                     ? kPrimaryColor.withOpacity(0.15)
//                                     : kSecondaryColor.withOpacity(0.1),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: SvgPicture.asset(
//                                 "assets/icons/Heart Icon_2.svg",
//                                 color: product.isFavourite
//                                     ? Color(0xFFFF4848)
//                                     : Color(0xFFDBDEE4),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 product.title,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(color: Colors.black),
//                 // maxLines: 1,
//               ),
//               Text(
//                 "\$${product.price}",
//                 style: TextStyle(
//                   fontSize: getProportionateScreenWidth(18),
//                   fontWeight: FontWeight.w600,
//                   color: kPrimaryColor,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Container(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(8),
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
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(30),
                          bottom: getProportionateScreenHeight(10)),
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
                          horizontal: getProportionateScreenWidth(8),
                          vertical: getProportionateScreenHeight(4),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            border: Border.all(
                                color: kPrimaryColor.withOpacity(0.6),
                                width: 1)),
                        child: Text(
                          '50% Off',
                          style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.6),
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
                // maxLines: 1,
              ),
              Text(
                "\$${product.price}",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
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

class CategoryChip extends StatelessWidget {
  final Category category;
  const CategoryChip({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(4),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            border:
                Border.all(color: kSecondaryColor.withOpacity(0.4), width: 1)),
        child: Text(
          category.name,
          style: TextStyle(
              color: kSecondaryColor.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
