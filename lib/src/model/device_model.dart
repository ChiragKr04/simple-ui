import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';

class DeviceModelData extends ChangeNotifier {
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
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef
        .child(rootNode)
        .child(roomKey)
        .child("devices")
        .child("$deviceName-${DateTime.now().millisecondsSinceEpoch}")
        .set(newData);
  }

  void updateDevice(String roomKey, String deviceKey, String deviceName) {
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef
        .child(rootNode)
        .child(roomKey)
        .child("devices")
        .child(deviceKey)
        .update({
      "name": deviceName,
    });
  }

  void deleteDevice(String roomKey, String deviceKey) {
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef
        .child(rootNode)
        .child(roomKey)
        .child("devices")
        .child(deviceKey)
        .remove();
  }

  void updateDeviceValue(String roomKey, String deviceKey, int deviceValue) {
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef
        .child(rootNode)
        .child(roomKey)
        .child("devices")
        .child(deviceKey)
        .update({
      "value": deviceValue,
    });
  }
}
