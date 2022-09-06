import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../model/getapi_model/veryComplex_model.dart';

class VeryComplexApi extends StatefulWidget {
  const VeryComplexApi({Key? key}) : super(key: key);

  @override
  State<VeryComplexApi> createState() => _VeryComplexApiState();
}

class _VeryComplexApiState extends State<VeryComplexApi> {
  @override
  Widget build(BuildContext context) {
    Future<VeryComplex> getdata() async {
      final response = await http.get(Uri.parse(
          "https://webhook.site/1055db45-cdcc-4209-b4c9-7d77c25db7c9"));

      var body = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return VeryComplex.fromJson(body);
      } else {
        return VeryComplex.fromJson(body);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Very Complex Api"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder<VeryComplex>(
              future: getdata(),
              builder: ((context, snapshot) {
                print("sanap ");
                // if (!snapshot.hasData) {
                //   return const Text("loading..");
                // }
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: ((context, index) {
                        var userdata = snapshot.data!.data![index];

                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                  elevation: 0.5,
                                  shadowColor: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                          dense: true,
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                userdata.image!.toString()),
                                          ),
                                          title: Text(
                                            userdata.name.toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                userdata.shopaddress.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                userdata.shopemail.toString(),
                                              ),
                                              Text(
                                                userdata.shopcity.toString(),
                                              ),
                                            ],
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(10)),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .4,
                                        width: double.infinity,
                                        color: Colors.purple,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: userdata.products!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, shopdata) {
                                            var shop =
                                                userdata.products![shopdata];
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .3,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .9,
                                              child: Card(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Text(shop.id.toString())
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .1,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .9,
                                                      child: ListTile(
                                                          dense: true,
                                                          leading: Text(
                                                            shop.description
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          title: Text(
                                                            shop.title
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          subtitle: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                shop.colors
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                              Text(
                                                                shop.price
                                                                    .toString(),
                                                              ),
                                                            ],
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(5)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .27,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .9,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            shop.images!.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int images) {
                                                          var imagedata = shop
                                                              .images![images];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  .25,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .7,
                                                              child: Card(
                                                                child: Image(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(
                                                                        imagedata
                                                                            .url
                                                                            .toString())),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  ))
                            ]);
                      }));
                }
                return const Text("Loading");
              })),
        )
      ]),
    );
  }
}
