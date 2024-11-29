import 'package:flutter/material.dart';

void main() {
  runApp(const  VideoApp());
}
class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VideoApp",
      theme: ThemeData(),
      home: HomeScreen(),

    );

  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

