import 'package:flutter/material.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_icon.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_style.dart';
import '../device_page/device_page.dart';

class RoomDataCard extends StatelessWidget {
  const RoomDataCard({
    super.key,
    required this.icon,
    required this.roomData,
    required this.roomName,
    required this.roomKey,
  });
  final IconData icon;
  final String roomName;
  final dynamic roomData;
  final dynamic roomKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DevicesPage(roomKey: roomKey, roomValue: roomData),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIcon(icon: icon),
            Text(
              roomName,
              style: ConstantTextStyle.cardSubTitleStyle,
            ),
            Text(
              "${roomData["devices"].length} devices",
              style: ConstantTextStyle.cardTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
