import 'dart:math';

import 'package:flutter/material.dart';

class MyUtils {
  static int generateDeviceValue(String deviceType) {
    switch (deviceType) {
      case "light":
        return Random().nextInt(101);
      case "fan":
        return Random().nextInt(5);
      case "ac":
        return 16 + Random().nextInt((30 + 1) - 16);
      case "door":
        return 0;
      default:
        return 0;
    }
  }
}

class IconUtils {
  static IconData getRoomIcon(String roomType) {
    roomType = roomType.toLowerCase().replaceAll(" ", "");
    if (roomType.contains("bedroom")) {
      return Icons.bed;
    } else if (roomType.contains("livingroom")) {
      return Icons.weekend;
    } else if (roomType.contains("kitchen")) {
      return Icons.countertops;
    } else if (roomType.contains("bathroom")) {
      return Icons.bathtub;
    } else {
      return Icons.bed;
    }
  }

  static IconData getDeviceIcon(String deviceType) {
    deviceType = deviceType.toLowerCase().replaceAll(" ", "");
    if (deviceType.contains("light")) {
      return Icons.lightbulb;
    } else if (deviceType.contains("fan")) {
      return Icons.wind_power;
    } else if (deviceType.contains("ac")) {
      return Icons.ac_unit;
    } else if (deviceType.contains("door")) {
      return Icons.meeting_room;
    } else {
      return Icons.settings_remote;
    }
  }
}
