import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:useofdio/UniversityModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<UniversityModel> universityData = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getDataFromServer();
      print("1Function called!!");
    });
  }

  Future<void> _getDataFromServer() async {
    try {
      print("Function called!!");
      var response = await Dio()
          .get('http://universities.hipolabs.com/search?country=United+States');

      print(response);
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("using the dio ")),
      body: ListView.builder(
          itemCount: universityData.length,
          itemBuilder: (context, index) {
            return const Text("data");
          }),
    );
  }
}
