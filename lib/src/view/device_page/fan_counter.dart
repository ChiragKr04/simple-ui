import 'package:flutter/material.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_style.dart';

class FanCounter extends StatefulWidget {
  const FanCounter({
    super.key,
    required this.deviceData,
  });
  final dynamic deviceData;

  @override
  State<FanCounter> createState() => _FanCounterState();
}

class _FanCounterState extends State<FanCounter> {
  late int fanCounter;

  @override
  void initState() {
    super.initState();
    fanCounter = widget.deviceData["value"];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (fanCounter > 0) {
                fanCounter--;
              }
            });
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: fanCounter == 0
                ? ConstantColors.lighGrey2
                : ConstantColors.iconColor,
            child: Icon(
              Icons.remove,
              color: fanCounter == 0
                  ? ConstantColors.lighGrey
                  : ConstantColors.bgColor,
            ),
          ),
        ),
        Text(
          "Speed $fanCounter",
          style: ConstantTextStyle.cardSubTitleStyle
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (fanCounter < 4) {
                fanCounter++;
              }
            });
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: fanCounter == 4
                ? ConstantColors.lighGrey2
                : ConstantColors.iconColor,
            child: Icon(
              Icons.add,
              color: fanCounter == 4
                  ? ConstantColors.lighGrey
                  : ConstantColors.bgColor,
            ),
          ),
        ),
      ],
    );
  }
}
