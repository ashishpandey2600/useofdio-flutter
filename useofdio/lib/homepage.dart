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

      List<UniversityModel> data = [];

      for (var item in response.data) {
        data.add(UniversityModel.fromJson(item));
      }
      setState(() {
        universityData = data;
      });
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text((index + 1).toString()),
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(universityData[index].name.toString()),
                          Text(universityData[index].domains.toString()),
                        ],
                      )),

                      Expanded(
                        flex: 3,
                        child: Text(universityData[index].country.toString()),),
                ],
              ),
            );
          }),
    );
  }
}
