import 'package:flutter/material.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';

class CustomButton extends StatelessWidget {
  final Color color, textColor;
  final String text;
  final double height, width;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Function onPress;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.fontSize,
    this.textColor = Colors.white,
    this.height = 60,
    this.fontWeight,
    this.width = double.infinity,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      // height: height,
      child: Card(
        // elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  onPress();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  minimumSize: Size(MediaQuery.of(context).size.width, 0),
                  primary: color,
                  // onPrimary: primaryColor,
                  fixedSize: Size(width, height),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: baseFontStyle.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: (color == Colors.white)
                            ? Colors.black
                            : textColor))),
          ],
        ),
      ),
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  final Color color, textColor, iconColor;
  final Function onPress;
  final String text;
  final double height, width;
  final IconData? icon;

  const CustomButtonIcon(
      {Key? key,
      required this.onPress,
      required this.text,
      this.icon,
      required this.color,
      this.iconColor = Colors.white,
      this.textColor = Colors.white,
      this.height = 60,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ElevatedButton(
            onPressed: () {
              onPress();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              minimumSize: Size(MediaQuery.of(context).size.width, 0),
              primary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(text,
                style: baseFontStyle.copyWith(
                    fontWeight: FontWeight.bold, color: textColor))),
      ),
    );
  }
}
