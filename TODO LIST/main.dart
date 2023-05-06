import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
