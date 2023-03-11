import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/device_controller.dart';
import 'package:mezcreen/src/controller/room_controller.dart';
import 'package:mezcreen/src/utils/constant_style.dart';
import 'package:mezcreen/src/utils/utils.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_button.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_icon.dart';
import '../../utils/constant_colors.dart';

class AddDeviceCard extends ConsumerWidget {
  const AddDeviceCard({
    super.key,
    required this.roomKey,
    this.isUpdation = false,
    this.deviceName = "",
    this.deviceType = "",
    this.deviceKey = "",
  });

  final String roomKey;
  final bool isUpdation;
  final String deviceName;
  final String deviceType;
  final String deviceKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return DevicePopUpUI(
              roomKey: roomKey,
              isUpdation: isUpdation,
              deviceName: deviceName,
              deviceType: deviceType,
              deviceKey: deviceKey,
            );
          },
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Card(
            color: ConstantColors.lighGrey2,
            child: Center(
              child: Icon(
                Icons.add_circle_outline,
                color: ConstantColors.iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DevicePopUpUI extends ConsumerWidget {
  const DevicePopUpUI({
    super.key,
    required this.roomKey,
    required this.isUpdation,
    required this.deviceName,
    required this.deviceType,
    required this.deviceKey,
  });

  final String roomKey;
  final bool isUpdation;
  final String deviceName;
  final String deviceType;
  final String deviceKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Builder(
      builder: (context) {
        var ctrl = TextEditingController(
          text: isUpdation ? deviceName : "",
        );
        List<String> dropDownList = ["Light", "Fan", "AC", "Door"];
        String dropDownValue = isUpdation ? deviceType : dropDownList.first;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              actions: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            child: Text(isUpdation ? "Update" : "Add"),
                            onPressed: () {
                              log("New device added ${ctrl.text} $dropDownValue");
                              if (isUpdation) {
                                DeviceController().updateDeviceName(
                                  ref,
                                  roomKey,
                                  deviceKey,
                                  ctrl.text.trim(),
                                );
                              } else {
                                DeviceController().addNewDevice(
                                  ref,
                                  roomKey,
                                  ctrl.text.trim(),
                                  dropDownValue,
                                );
                              }
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    !isUpdation
                        ? const Offstage()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    DeviceController().deleteDevice(
                                      ref,
                                      roomKey,
                                      deviceKey,
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        "Delete",
                                        style: ConstantTextStyle
                                            .cardSubTitleStyle
                                            .copyWith(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                )
              ],
              title: Column(
                children: [
                  CustomIcon(
                    icon: IconUtils.getDeviceIcon(dropDownValue),
                  ),
                  Text(
                    isUpdation ? "Update device" : "Add new device",
                    style: ConstantTextStyle.cardSubTitleStyle.copyWith(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Name",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: ctrl,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  isUpdation
                      ? const Offstage()
                      : const SizedBox(
                          height: 8,
                        ),
                  isUpdation
                      ? const Offstage()
                      : const Text(
                          "Type",
                        ),
                  isUpdation
                      ? const Offstage()
                      : const SizedBox(
                          height: 8,
                        ),
                  isUpdation
                      ? const Offstage()
                      : DecoratedBox(
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: ConstantColors.lighGrey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              value: dropDownValue,
                              isExpanded: true,
                              underline: const Offstage(),
                              items: dropDownList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropDownValue = value!;
                                });
                              },
                            ),
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
