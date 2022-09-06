import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DifficultApiWithCustomModel extends StatefulWidget {
  const DifficultApiWithCustomModel({Key? key}) : super(key: key);

  @override
  State<DifficultApiWithCustomModel> createState() =>
      _DifficultApiWithCustomModelState();
}

class _DifficultApiWithCustomModelState
    extends State<DifficultApiWithCustomModel> {
  var data;
  Future getdata() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return data = jsonDecode(response.body.toString());
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Difficult api model"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("loading..");
              }
              if (snapshot.hasError) {
                return const Center(
                    child: Text("Oops! There is something wrong"));
              }
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var userdata = data[index];
                    return Card(
                      child: ListTile(
                          dense: true,
                          leading: Text(
                            "User id\n${userdata["id"]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          title: Text(
                            "Nested Company\nName: ${userdata["company"]["name"]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Nested Body",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Email: ${userdata["email"].toString()}",
                              ),
                              Text(
                                "City: ${userdata["address"]["city"].toString()}",
                              ),
                              Text(
                                "ZipCode: ${userdata["address"]["zipcode"].toString()}",
                              ),
                              Text(
                                "Geo: Latitude: ${userdata["address"]["geo"]["lat"].toString()}",
                              ),
                            ],
                          ),
                          contentPadding: const EdgeInsets.all(10)),
                    );
                  },
                );
              } else {
                return const Center(child: Text("Loading"));
              }
            },
          ))
        ],
      ),
    );
  }
}
