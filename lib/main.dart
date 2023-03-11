import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcreen/env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mezcreen/firebase_options.dart';

import 'package:mezcreen/sampleData.dart';
import 'package:mezcreen/src/view/room_page/room_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await checkForTestData();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> checkForTestData() async {
  DataSnapshot dataSnapshot =
      await FirebaseDatabase.instance.ref().child(rootNode).get();
  if (dataSnapshot.value != null) return;
  await FirebaseDatabase.instance.ref().child(rootNode).set(data);
}

FirebaseDatabase database = FirebaseDatabase.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "App for $rootNode";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        textTheme: GoogleFonts.interTextTheme(
          ThemeData(
            brightness: Brightness.light,
          ).textTheme,
        ),
      ),
      title: _title,
      home: const SafeArea(child: RoomsPage()),
    );
  }
}
