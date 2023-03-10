import 'package:flutter/material.dart';
import 'package:mezcreen/src/utils/constant_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          ConstantColors.buttonColor,
        ),
      ),
      child: child,
      onPressed: () {
        onPressed();
      },
    );
  }
}
