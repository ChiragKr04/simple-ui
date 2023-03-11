import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/global_controller.dart';
import 'package:mezcreen/src/utils/constant_strings.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_style.dart';

class ACCounter extends StatefulWidget {
  const ACCounter({
    super.key,
    required this.deviceData,
    required this.deviceKey,
    required this.roomKey,
  });
  final dynamic deviceData;
  final String deviceKey;
  final String roomKey;

  @override
  State<ACCounter> createState() => ACCounterState();
}

class ACCounterState extends State<ACCounter> {
  late int acCounter;

  @override
  void initState() {
    super.initState();
    acCounter = widget.deviceData["value"];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (acCounter > 16) {
                  acCounter--;
                  ref.read(deviceController).updateDeviceValue(
                      widget.roomKey, widget.deviceKey, acCounter);
                }
              });
            },
            child: CircleAvatar(
              radius: 12,
              backgroundColor: acCounter == 16
                  ? ConstantColors.lighGrey2
                  : ConstantColors.iconColor,
              child: Icon(
                Icons.remove,
                color: acCounter == 16
                    ? ConstantColors.lighGrey
                    : ConstantColors.bgColor,
              ),
            ),
          ),
          Text(
            "$acCounter${ConstantStrings.degreeSymbol}",
            style: ConstantTextStyle.cardSubTitleStyle
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (acCounter < 30) {
                  acCounter++;
                  ref.read(deviceController).updateDeviceValue(
                      widget.roomKey, widget.deviceKey, acCounter);
                }
              });
            },
            child: CircleAvatar(
              radius: 12,
              backgroundColor: acCounter == 30
                  ? ConstantColors.lighGrey2
                  : ConstantColors.iconColor,
              child: Icon(
                Icons.add,
                color: acCounter == 30
                    ? ConstantColors.lighGrey
                    : ConstantColors.bgColor,
              ),
            ),
          ),
        ],
      );
    });
  }
}
