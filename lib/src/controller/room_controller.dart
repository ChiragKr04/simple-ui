import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';

class RoomController extends ChangeNotifier {
  void addNewRoom(
    String roomName,
    String roomType,
  ) {
    log("NEW ROOM ADDED PVD");
    final newData = {
      "devices": null,
      "name": roomName,
    };
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef
        .child(rootNode)
        .child("$roomName-${DateTime.now().millisecondsSinceEpoch}")
        .set(newData);
  }
}
