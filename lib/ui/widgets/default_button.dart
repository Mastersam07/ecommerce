import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.textStyle,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.height(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: AppColors.kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: textStyle ??
              TextStyle(
                fontSize: SizeConfig.width(18),
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
