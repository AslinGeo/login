import 'package:flutter/material.dart';
import 'package:login/modal/loginmodal.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({ Key? key,this.data }) : super(key: key);
final dynamic data;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.data[0] ?? ''),),
    );
  }
}