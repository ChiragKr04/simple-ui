import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';
import 'package:mezcreen/src/utils/constant_colors.dart';
import 'package:mezcreen/src/utils/icon_utils.dart';
import 'package:mezcreen/src/view/room_page/add_room_card.dart';

import 'room_data_card.dart';
import 'room_page_content.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.bgColor,
      // appBar: AppBar(title: const Text("Rooms")),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        textAlign: TextAlign.center,
        child: FutureBuilder<DataSnapshot>(
          future: FirebaseDatabase.instance
              .ref()
              .child(rootNode)
              .get(), // a previously-obtained Future<String> or null
          builder:
              (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.hasData) {
              Map<dynamic, dynamic> rooms =
                  snapshot.data!.value as Map<dynamic, dynamic>;
              log("rooms $rooms");
              rooms.forEach((key, value) {
                log("value $value");
                children.add(
                  RoomDataCard(
                    roomName: value["name"],
                    icon: IconUtils.getRoomIcon(key),
                    roomKey: key,
                    roomData: value,
                  ),
                );
              });
              children.add(
                const AddRoomCard(),
              );
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return RoomPageContent(children: children);
          },
        ),
      ),
    );
  }
}
