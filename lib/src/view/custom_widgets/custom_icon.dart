import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mezcreen/src/utils/constant_colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.radius = 20,
  });
  final IconData icon;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: ConstantColors.iconBgColor,
      child: Icon(
        icon,
        color: ConstantColors.iconColor,
      ),
    );
  }
}
