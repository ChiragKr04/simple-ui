import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';
import 'package:mezcreen/src/service/firebase_service.dart';

class RoomController extends ChangeNotifier {
  final firebaseService = FirebaseService();
  void addNewRoom(
    String roomName,
    String roomType,
  ) {
    log("NEW ROOM ADDED PVD");
    final newData = {
      "devices": null,
      "name": roomName,
    };
    String roomId = "$roomName-${DateTime.now().millisecondsSinceEpoch}";
    firebaseService.add(
      path: "$rootNode/$roomId",
      data: newData,
    );
  }
}
