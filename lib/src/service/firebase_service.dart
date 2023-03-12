import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

final databaseRef = FirebaseDatabase.instance.ref();

class FirebaseService {
  Future<bool> add({
    required String path,
    required dynamic data,
  }) {
    try {
      return databaseRef.child(path).set(data).then(
            (value) => true,
          );
    } on Exception catch (_, e) {
      log("Error [add]: $e");
      return Future(() => false);
    }
  }

  Future<bool> update({
    required String path,
    required dynamic data,
  }) {
    try {
      return databaseRef.child(path).update(data).then(
            (value) => true,
          );
    } on Exception catch (_, e) {
      log("Error [update]: $e");
      return Future(() => false);
    }
  }

  Future<bool> delete({
    required String path,
  }) {
    try {
      return databaseRef.child(path).remove().then(
            (value) => true,
          );
    } on Exception catch (_, e) {
      log("Error [delete]: $e");
      return Future(() => false);
    }
  }
}
