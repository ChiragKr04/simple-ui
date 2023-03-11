import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/model/device_model.dart';
import 'package:mezcreen/src/model/room_model.dart';

final roomModelProvider = ChangeNotifierProvider<RoomModelData>((ref) {
  return RoomModelData();
});

final deviceModalProvider = ChangeNotifierProvider<DeviceModelData>((ref) {
  return DeviceModelData();
});
