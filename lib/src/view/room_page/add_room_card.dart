import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/room_controller.dart';
import 'package:mezcreen/src/utils/constant_style.dart';
import 'package:mezcreen/src/utils/icon_utils.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_button.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_icon.dart';
import '../../utils/constant_colors.dart';

class AddRoomCard extends ConsumerWidget {
  const AddRoomCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            var ctrl = TextEditingController();
            List<String> dropDownList = [
              "Bedroom",
              "Living Room",
              "Kitchen",
              "Bathroom"
            ];
            String dropDownValue = dropDownList.first;
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            child: const Text("Add"),
                            onPressed: () {
                              log("New room added ${ctrl.text} $dropDownValue");
                              RoomController().addNewRoom(
                                ref,
                                ctrl.text.trim(),
                                dropDownValue,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                  title: Column(
                    children: [
                      CustomIcon(
                        icon: IconUtils.getRoomIcon(dropDownValue),
                      ),
                      Text(
                        "Add new room",
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
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Type",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DecoratedBox(
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            value: dropDownValue,
                            isExpanded: true,
                            underline: const Offstage(),
                            items: dropDownList
                                .map<DropdownMenuItem<String>>((String value) {
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
      },
      child: const Card(
        elevation: 2,
        color: ConstantColors.lighGrey2,
        child: Center(
          child: Icon(
            Icons.add_circle_outline,
            color: ConstantColors.iconColor,
          ),
        ),
      ),
    );
  }
}
