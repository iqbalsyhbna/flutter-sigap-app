import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sigap_mobile/core/app/app_constants.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';
import 'package:sigap_mobile/core/theme/app_theme.dart';

Widget loadingIndicator = const SpinKitThreeBounce(size: 45, color: primaryColor);

Widget customCard({
  Key? key,
  required Color borderColor,
  Color backgroundColor = Colors.white,
  required double borderRadius,
  required Widget child,
  required Function onPress,
}) {
  return InkWell(
    onTap: () => onPress(),
    child: Card(
        color: backgroundColor,
        margin: const EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: child),
  );
}

Widget circleIcon(
    {required Function onPress,
    required IconData icon,
    Color? backgroundColor = Colors.black,
    Color color = Colors.white,
    double iconSize = 30,
    double size = 56}) {
  return ClipOval(
    child: Material(
      color: backgroundColor,
      child: InkWell(
        splashColor: Colors.grey, // Splash color
        onTap: () => onPress(),
        child: Container(
            color: Colors.black54.withOpacity(0.6),
            width: size,
            height: size,
            child: Icon(
              icon,
              size: iconSize,
              color: color,
            )),
      ),
    ),
  );
}

class Content extends StatelessWidget {
  final Widget? child;
  const Content({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
            defaultMargin, 0, defaultMargin, defaultMargin),
        child: child);
  }
}

class CustomAppBar extends StatelessWidget {
  final Color? backgroundColor, textColor, iconColor;
  final Function onPress;
  final String title;

  const CustomAppBar(
      {Key? key,
      required this.onPress,
      this.title = '',
      this.iconColor,
      this.backgroundColor,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,
                color: (iconColor == null)
                    ? context.isDarkMode()
                        ? primaryColor
                        : Colors.black
                    : iconColor),
            onPressed: () => onPress()),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  const Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        "${clockTimer.inMinutes.remainder(60).toString()}:${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, "0")}";

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 110,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
