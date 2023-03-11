import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/device_controller.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_style.dart';

class FanCounter extends StatefulWidget {
  const FanCounter({
    super.key,
    required this.deviceData,
    required this.roomKey,
    required this.deviceKey,
  });
  final dynamic deviceData;
  final String roomKey;
  final String deviceKey;

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
    return Consumer(builder: (context, ref, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (fanCounter > 0) {
                  fanCounter--;
                  DeviceController().updateDeviceValue(
                    ref,
                    widget.roomKey,
                    widget.deviceKey,
                    fanCounter,
                  );
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
                  DeviceController().updateDeviceValue(
                    ref,
                    widget.roomKey,
                    widget.deviceKey,
                    fanCounter,
                  );
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
    });
  }
}
