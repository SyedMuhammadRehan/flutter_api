import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../model/custom_get_api_model/custom_model.dart';

class CustomImageModelScreen extends StatefulWidget {
  const CustomImageModelScreen({Key? key}) : super(key: key);

  @override
  State<CustomImageModelScreen> createState() => _CustomImageModelScreenState();
}

class _CustomImageModelScreenState extends State<CustomImageModelScreen> {
  List<CustomImageModel> photomodel = [];
  Future<List<CustomImageModel>> getphotodata() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var body = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map data in body) {
        // print(data.entries);
        CustomImageModel model = CustomImageModel(
            id: data['id'], title: data['title'], url: data['url']);
        photomodel.add(model);
        // print("length   ${photomodel.toList()}");
      }
      return photomodel;
    } else {
      return photomodel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Model"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<CustomImageModel>>(
                  future: getphotodata(),
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
                          itemCount: photomodel.length,
                          itemBuilder: (context, index) {
                            var imgdata = photomodel[index];
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                      dense: true,
                                      leading: FittedBox(
                                        fit: BoxFit.cover,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            imgdata.url,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "User id\n${imgdata.id.toString()}",
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Image Title:\n${imgdata.title}",
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.all(10)),
                                )
                              ],
                            );
                          });
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
