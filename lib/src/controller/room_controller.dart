import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mezcreen/src/model/global_models.dart';

class RoomController {
  void addNewRoom(
    WidgetRef ref,
    String roomName,
    String roomType,
  ) {
    ref.read(roomModelProvider).addNewRoom();
  }
}
