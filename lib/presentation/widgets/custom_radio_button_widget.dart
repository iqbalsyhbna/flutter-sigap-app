import 'package:flutter/material.dart';

class CustomRadioField extends StatelessWidget {

  final Widget child;
  final String title;

  const CustomRadioField({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: SizedBox(
        child: Container(
            padding: const EdgeInsets.all(4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  child,
                  Text(title),
                ])),
      ),
    );
  }
}
