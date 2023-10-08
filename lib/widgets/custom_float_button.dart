import 'package:flutter/material.dart';
import 'package:lets_chat/themes/colors.dart';
import 'package:lets_chat/views/register_page.dart';

class CustomFloatButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomFloatButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 90,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              title,
              style: const TextStyle(color: AppColor.primary),
            ),
          ),
        )
      ],
    );
  }
}
