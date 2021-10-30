import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 0;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Colors',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ...List.generate(
                product.colors.length,
                (index) => ColorDot(
                  color: product.colors[index],
                  isSelected: index == selectedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(3)),
      height: getProportionateScreenWidth(25),
      width: getProportionateScreenWidth(25),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.transparent, width: 2.0),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SizeDots extends StatelessWidget {
  const SizeDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 0;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Sizes',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ...List.generate(
                product.sizes.length,
                (index) => SizeDot(
                  size: product.sizes[index],
                  isSelected: index == selectedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizeDot extends StatelessWidget {
  const SizeDot({
    Key? key,
    required this.size,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(8),
      ),
      child: Container(
        margin: EdgeInsets.only(right: 2),
        height: getProportionateScreenWidth(30),
        width: getProportionateScreenWidth(30),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey,
            width: 1.0,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$size',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
