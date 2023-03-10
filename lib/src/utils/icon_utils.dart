import 'package:flutter/material.dart';

class IconUtils {
  static IconData getRoomIcon(String roomType) {
    switch (roomType.toLowerCase().replaceAll(" ", "")) {
      case "bedroom":
        return Icons.bed;
      case "livingroom":
        return Icons.weekend;
      case "kitchen":
        return Icons.countertops;
      case "bathroom":
        return Icons.bathtub;
      default:
        return Icons.bed;
    }
  }

  static IconData getDeviceIcon(String deviceType) {
    switch (deviceType.toLowerCase().replaceAll(" ", "")) {
      case "light":
        return Icons.lightbulb;
      case "fan":
        return Icons.wind_power;
      case "ac":
        return Icons.ac_unit;
      case "door":
        return Icons.meeting_room;
      default:
        return Icons.bed;
    }
  }
}
