import 'package:flutter/material.dart';
import 'package:mezcreen/src/view/custom_widgets/custom_icon.dart';

import '../../utils/constant_style.dart';

class EnergyCard extends StatelessWidget {
  const EnergyCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomIcon(
                icon: icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: ConstantTextStyle.cardTitleStyle,
                    ),
                    Text(
                      subTitle,
                      style: ConstantTextStyle.cardSubTitleStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
