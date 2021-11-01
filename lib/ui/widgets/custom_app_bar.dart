import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  CustomAppBar({Key? key, required this.rating}) : super(key: key);

  // AppBar().preferredSize.height provide us
  //the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: SizeConfig.width(40),
              width: SizeConfig.width(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: AppColors.kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/Back ICon.svg',
                  height: 15,
                ),
              ),
            ),
            // Spacer(),
            NumCountdown(
              leadingTxt: 'Closing in',
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumCountdown extends StatelessWidget {
  const NumCountdown({
    Key? key,
    required this.leadingTxt,
  }) : super(key: key);

  final String leadingTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$leadingTxt  ',
          style: TextStyle(
            fontSize: SizeConfig.width(14),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  '07',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  '07',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  '07',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
