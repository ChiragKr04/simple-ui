import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/model/global_models.dart';
import 'package:mezcreen/src/utils/utils.dart';

class DeviceController {
  void addNewDevice(
    WidgetRef ref,
    String roomKey,
    String deviceName,
    String deviceType,
  ) {
    ref.read(deviceModalProvider).addNewDevice(
          roomKey,
          deviceName,
          deviceType,
          MyUtils.generateDeviceValue(deviceType.toLowerCase()),
        );
  }

  void updateDeviceName(
      WidgetRef ref, String roomKey, String deviceKey, String deviceName) {
    ref.read(deviceModalProvider).updateDevice(roomKey, deviceKey, deviceName);
  }

  void updateDeviceValue(
      WidgetRef ref, String roomKey, String deviceKey, int deviceValue) {
    ref
        .read(deviceModalProvider)
        .updateDeviceValue(roomKey, deviceKey, deviceValue);
  }

  void deleteDevice(WidgetRef ref, String roomKey, String deviceKey) {
    ref.read(deviceModalProvider).deleteDevice(roomKey, deviceKey);
  }
}
