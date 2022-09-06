import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/model/nestedapi_model.dart';
import 'package:http/http.dart' as http;

class NestedApi extends StatefulWidget {
  const NestedApi({Key? key}) : super(key: key);

  @override
  State<NestedApi> createState() => _NestedApiState();
}

class _NestedApiState extends State<NestedApi> {
  List<NestedapiModel> nestedapiModel = [];
  Future<List<NestedapiModel>> getpostdata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        nestedapiModel.add(NestedapiModel.fromJson(i));
      }
      return nestedapiModel;
    } else {
      return nestedapiModel;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nested Api"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Expanded(
          child: FutureBuilder<List<NestedapiModel>>(
              future: getpostdata(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("loading..");
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                      itemCount: nestedapiModel.length,
                      itemBuilder: ((context, index) {
                        var data = nestedapiModel[index];
                        return Card(
                          child: ListTile(
                              dense: true,
                              leading: Text(
                                "User id\n${data.id.toString()}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              title: Text(
                                "Nested Company\nName: ${data.company!.name}",
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
                                    "Email: ${data.email.toString()}",
                                  ),
                                  Text(
                                    "City: ${data.address!.city.toString()}",
                                  ),
                                  Text(
                                    "ZipCode: ${data.address!.zipcode.toString()}",
                                  ),
                                  Text(
                                    "Geo: Latitude: ${data.address!.geo!.lat.toString()}",
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(10)),
                        );
                      }));
                }
                return const Text("Loading");
              })),
        )
      ])),
    );
  }
}
