import 'package:flutter/material.dart';
import '../../core/models/cart_model.dart';
import '../../utils/size_config.dart';
import '../../utils/colors.dart';
import 'quatity_indicator.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.width(10)),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(cart.product.images[0]),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '\$${cart.product.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: SizeConfig.width(100),
                      ),
                      NumIndicator(numOfItem: cart.numOfItem),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Remove',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryColor),
                ),
              ),
              Text(
                'Save for later',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kPrimaryColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
