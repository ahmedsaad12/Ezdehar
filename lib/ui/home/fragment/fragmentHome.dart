import 'dart:convert';
import 'dart:developer';

import 'package:ezdehar/model/newsmodel.dart';
import 'package:ezdehar/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


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
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    itemCount: newsModel.data.length,
                    itemBuilder: (context, index) => Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              Text(
                                newsModel.data[index].title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image(
                                  image: Image.network(
                                          newsModel.data[index].image,
                                          fit: BoxFit.fill)
                                      .image),
                              const SizedBox(height: 10),
                                  Text(
                                    maxLines:4,
                                  Html(

                                data: newsModel.data[index].details

                              ).data),
                            ])))
                : const CircularProgressIndicator()));
  }

  Future<void> getList() async {
    newsModel = await service.getData();

    setState(()  {

      newsModel;
    });
  }
  @override
  void initState() {
    super.initState();
    getList();
  }
}
