import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RoomModelData extends ChangeNotifier {
  void addNewRoom() {
    log("NEW ROOM ADDED PVD");
    FirebaseDatabase.instance.ref();
  }
}
