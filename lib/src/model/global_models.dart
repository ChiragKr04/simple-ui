import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/model/room_model.dart';

final roomModelProvider = ChangeNotifierProvider<RoomModelData>((ref) {
  return RoomModelData();
});