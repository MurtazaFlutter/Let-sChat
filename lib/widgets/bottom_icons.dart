import 'package:flutter/material.dart';
import 'package:lets_chat/themes/colors.dart';

class BottomNavBarIcons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final bool isSelected;
  const BottomNavBarIcons({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[300]),
              child: Icon(
                iconData,
                color: isSelected ? AppColor.primary : Colors.grey,
                size: 26,
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                iconData,
                color: isSelected ? AppColor.primary : Colors.grey,
                size: 26,
              ),
            ),
          );
  }
}
