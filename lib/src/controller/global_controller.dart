import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/controller/device_controller.dart';
import 'package:mezcreen/src/controller/room_controller.dart';

final roomController = ChangeNotifierProvider<RoomController>((ref) {
  return RoomController();
});

final deviceController = ChangeNotifierProvider<DeviceController>((ref) {
  return DeviceController();
});
