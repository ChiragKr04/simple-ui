import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';
import 'package:mezcreen/src/service/firebase_service.dart';

class DeviceController extends ChangeNotifier {
  final firebaseService = FirebaseService();
  void addNewDevice(
    String roomKey,
    String deviceName,
    String deviceType,
    int deviceValue,
  ) {
    log("NEW DEVICE ADDED PVD");
    final newData = {
      "name": deviceName,
      "type": deviceType.toLowerCase(),
      "value": deviceValue,
    };
    String deviceId = "$deviceName-${DateTime.now().millisecondsSinceEpoch}";
    firebaseService.add(
      path: "$rootNode/$roomKey/devices/$deviceId",
      data: newData,
    );
  }

  void updateDevice(String roomKey, String deviceKey, String deviceName) {
    var updationData = {
      "name": deviceName,
    };
    firebaseService.update(
      path: "$rootNode/$roomKey/devices/$deviceKey",
      data: updationData,
    );
  }

  void deleteDevice(String roomKey, String deviceKey) {
    firebaseService.delete(
      path: "$rootNode/$roomKey/devices/$deviceKey",
    );
  }

  void updateDeviceValue(String roomKey, String deviceKey, int deviceValue) {
    var updationData = {
      "value": deviceValue,
    };
    firebaseService.update(
      path: "$rootNode/$roomKey/devices/$deviceKey",
      data: updationData,
    );
  }
}
