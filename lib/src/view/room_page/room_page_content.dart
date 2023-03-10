import 'package:flutter/material.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_icon.dart';

import '../../utils/constant_colors.dart';
import '../../utils/constant_strings.dart';
import 'energy_card.dart';

class RoomPageContent extends StatelessWidget {
  const RoomPageContent({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Hello Mateo,",
                style: TextStyle(
                  fontSize: 24,
                  color: ConstantColors.textColor,
                ),
              ),
              CustomIcon(
                radius: 28,
                icon: Icons.person,
              ),
            ],
          ),
          const Text(
            "Today's Weather",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              children: const [
                Icon(
                  Icons.cloud,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "14 ${ConstantStrings.degreeSymbol}C",
                    style: TextStyle(
                      fontSize: 15,
                      color: ConstantColors.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Energy Saving",
            style: TextStyle(
              fontSize: 18,
              color: ConstantColors.textColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              EnergyCard(
                title: "Today",
                subTitle: "93 kWh",
                icon: Icons.power,
              ),
              EnergyCard(
                title: "This Week",
                subTitle: "970,244 kWh",
                icon: Icons.bolt,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Rooms",
              style: TextStyle(
                fontSize: 18,
                color: ConstantColors.textColor,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: children.length,
              itemBuilder: (context, index) {
                return children[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
