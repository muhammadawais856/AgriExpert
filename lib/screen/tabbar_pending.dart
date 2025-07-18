import 'package:flutter/material.dart';

class tabbar_pending extends StatefulWidget {
  const tabbar_pending({super.key});

  @override
  State<tabbar_pending> createState() => _tabbar_pendingState();
}

class _tabbar_pendingState extends State<tabbar_pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("pending", style: TextStyle(fontSize: 50),),
    );
  }
}
