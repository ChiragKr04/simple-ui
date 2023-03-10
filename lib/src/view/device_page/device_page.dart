import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mezcreen/env.dart';
import 'package:mezcreen/src/utils/constant_colors.dart';
import 'package:mezcreen/src/view/device_page/add_device_card.dart';
import 'package:mezcreen/src/view/device_page/device_data_card.dart';

class DevicesPage extends StatefulWidget {
  final String roomKey;
  final dynamic roomValue;
  const DevicesPage({
    super.key,
    required this.roomKey,
    required this.roomValue,
  });

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.bgColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.roomValue['name'],
          style: const TextStyle(
            color: ConstantColors.textColor,
          ),
        ),
      ),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        textAlign: TextAlign.center,
        child: StreamBuilder<DatabaseEvent>(
          stream: FirebaseDatabase.instance
              .ref()
              .child("$rootNode/${widget.roomKey}/devices")
              .onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            List<Widget> children = <Widget>[];
            if (snapshot.hasData) {
              log("DEVICE DATA ${snapshot.data!.snapshot.value}");
              Map<dynamic, dynamic> rooms =
                  snapshot.data!.snapshot.value == null
                      ? {}
                      : snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
              rooms.forEach(
                (key, value) {
                  children.add(DeviceDataCard(
                    deviceData: value,
                    roomKey: widget.roomKey,
                    deviceKey: key,
                  ));
                },
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddDeviceCard(roomKey: widget.roomKey),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.4),
                      itemCount: children.length,
                      itemBuilder: (context, index) {
                        return children[index];
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
