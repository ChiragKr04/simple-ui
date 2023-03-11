import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/global_controller.dart';
import 'package:mezcreen/src/view/device_page/ac_counter.dart';
import 'package:mezcreen/src/view/device_page/add_device_card.dart';
import 'package:mezcreen/src/view/device_page/fan_counter.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_style.dart';
import '../../utils/utils.dart';

class DeviceDataCard extends ConsumerStatefulWidget {
  const DeviceDataCard({
    super.key,
    required this.deviceData,
    required this.roomKey,
    required this.deviceKey,
  });
  final dynamic deviceData;
  final String roomKey;
  final String deviceKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeviceDataCardState();
}

class _DeviceDataCardState extends ConsumerState<DeviceDataCard> {
  late bool switchValue;
  @override
  void initState() {
    super.initState();
    switchValue = widget.deviceData["value"] == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    log("value ${widget.deviceData}");
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return DevicePopUpUI(
              roomKey: widget.roomKey,
              isUpdation: true,
              deviceKey: widget.deviceKey,
              deviceName: widget.deviceData["name"],
              deviceType: widget.deviceData["type"].toString().replaceFirst(
                    widget.deviceData["type"].toString()[0],
                    widget.deviceData["type"].toString()[0].toUpperCase(),
                  ),
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    IconUtils.getDeviceIcon(
                      widget.deviceData["type"],
                    ),
                    color: ConstantColors.iconColor,
                  ),
                  Switch(
                    activeColor: ConstantColors.iconColor,
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = !switchValue;
                        int newValue = switchValue
                            ? MyUtils.generateDeviceValue(
                                widget.deviceData["type"])
                            : 0;
                        newValue = widget.deviceData["type"] == "door"
                            ? switchValue
                                ? 1
                                : 0
                            : newValue;
                        ref.read(deviceController).updateDeviceValue(
                            widget.roomKey, widget.deviceKey, newValue);
                      });
                    },
                  ),
                ],
              ),
              Text(
                widget.deviceData["name"],
                style: ConstantTextStyle.cardSubTitleStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    !switchValue
                        ? widget.deviceData["type"] == "door"
                            ? "Closed"
                            : "Off"
                        : widget.deviceData["type"] == "door"
                            ? "Open"
                            : "On",
                    style: ConstantTextStyle.cardTitleStyle,
                  ),
                  widget.deviceData["type"] == "light" && switchValue
                      ? Row(
                          children: [
                            const Icon(
                              Icons.highlight,
                              color: ConstantColors.lighGrey,
                              size: 16,
                            ),
                            Text(
                              "${widget.deviceData["value"]}%",
                              style: ConstantTextStyle.cardTitleStyle,
                            ),
                          ],
                        )
                      : const Offstage(),
                ],
              ),
              widget.deviceData["type"] == "light" && switchValue
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: ColoredBox(
                            color: ConstantColors.lighGrey2,
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: double.parse(
                                      widget.deviceData["value"].toString()) *
                                  0.01,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: const ColoredBox(
                                  color: ConstantColors.iconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Offstage(),
              widget.deviceData["type"] == "ac" && switchValue
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ACCounter(
                        deviceData: widget.deviceData,
                        roomKey: widget.roomKey,
                        deviceKey: widget.deviceKey,
                      ),
                    )
                  : const Offstage(),
              widget.deviceData["type"] == "fan" && switchValue
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FanCounter(
                        deviceData: widget.deviceData,
                        roomKey: widget.roomKey,
                        deviceKey: widget.deviceKey,
                      ),
                    )
                  : const Offstage()
            ],
          ),
        ),
      ),
    );
  }
}
