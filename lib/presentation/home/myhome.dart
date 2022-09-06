import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_api/presentation/drawer/drawer.dart';
import 'package:http/http.dart' as http;

import '../../model/getapi_model/post_model.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  List<PostModel> postModel = [];
  Future<List<PostModel>> getpostdata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postModel.add(PostModel.fromJson(i));
      }
      return postModel;
    } else {
      return postModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        title: const Text("Normal Api"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Expanded(
          child: FutureBuilder<List<PostModel>>(
              future: getpostdata(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("loading..");
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                      itemCount: postModel.length,
                      itemBuilder: ((context, index) {
                        var data = postModel[index];
                        return Card(
                          child: ListTile(
                              leading:
                                  Text("User id\n ${data.userId.toString()}"),
                              title: Text("Title \n ${data.title}"),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Body"),
                                  Text(
                                    "    ${data.body.toString()}",
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(10)),
                        );
                      }));
                }
                return const Text("data");
              })),
        )
      ])),
    );
  }
}
