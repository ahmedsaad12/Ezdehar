import 'dart:developer';

import 'package:ezdehar/model/newsmodel.dart';
import 'package:ezdehar/services/services.dart';
import 'package:flutter/material.dart';

class MyApps extends StatefulWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  State<MyApps> createState() => _MyAppState();
}

class _MyAppState extends State<MyApps> {
  Services service = Services();

  NewsModel newsModel = NewsModel(data: [], status: 0);

  @override
  Widget build(BuildContext context) {
    //getList();

    return Scaffold(
        body: Center(
            child: newsModel.data.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    itemCount: newsModel.data.length,
                    itemBuilder: (context, index) => Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              Text(
                                newsModel.data[index].title,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Image(
                                  image: Image.network(
                                          newsModel.data[index].image,
                                          fit: BoxFit.fill)
                                      .image),
                              SizedBox(height: 10),
                              Text(
                                newsModel.data[index].details,
                                maxLines: 3,
                              ),
                            ])))
                : CircularProgressIndicator()));
  }

  Future<void> getList() async {
    setState(() async {
    newsModel = await service.getData();

      newsModel;
    });
  }
  @override
  void initState() {
    super.initState();
    getList();
  }
}
