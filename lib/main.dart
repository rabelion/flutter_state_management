import 'package:flutter/material.dart';
import 'package:flutter_wisata_surabaya/detail_screen.dart';
import 'package:flutter_wisata_surabaya/main_screen.dart';
import 'package:flutter_wisata_surabaya/provider/done_tourism_provider.dart';
import 'package:flutter_wisata_surabaya/tourism_list.dart';
import 'package:flutter_wisata_surabaya/list_item.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(),
        home: MainScreen(),
      ),
    );
  }
}