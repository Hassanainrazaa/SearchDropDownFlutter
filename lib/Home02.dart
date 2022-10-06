import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/Wdigets/WidSearch.dart';

class Home02 extends StatefulWidget {
  const Home02({super.key});

  @override
  State<Home02> createState() => _Home02State();
}

class _Home02State extends State<Home02> {
  bool checkBool = true;
  List<Map<String, dynamic>> searchTerms = [
    {"name": "San Diago, CA", "age": 5},
    {"name": "San Fransisco, CA", "age": 5},
    {"name": "San Jose, CA", "age": 5},
  ];
  List<Map<String, dynamic>> foundTerm = [];
  @override
  void initState() {
    foundTerm = searchTerms;
    // TODO: implement initState
    super.initState();
  }

  TextEditingController searchctrl = new TextEditingController();

  void runfilter(String enteredkeyword) {
    List<Map<String, dynamic>> result = [];
    if (enteredkeyword.isEmpty) {
      result = searchTerms;
    } else {
      result = searchTerms
          .where((place) => place["name"]
              .toLowerCase()
              .contains(enteredkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundTerm = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                (checkBool == true)
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.0),
                        ),
                      )
                    : Text("nothing"),
                TextFormField(
                    controller: searchctrl,
                    onTap: () {
                      setState(() {
                        checkBool = !checkBool;
                      });
                    },
                    onChanged: (value) {
                      runfilter(value);
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter",
                        prefixIcon: Icon(Icons.location_on),
                        //icon: const Icon(Icons.man_rounded),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: Colors.green)))),
                Container(
                  height: 150,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: foundTerm.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                foundTerm[index]["name"].toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 0.2,
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Stack(
                  children: [
                    const FlutterLogo(
                      size: 80,
                    ),
                  ],
                ),
                // (checkBool == true)
                //     ? BackdropFilter(
                //         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                //         child: Column(
                //           children: [
                //             Container(
                //               color: Colors.black.withOpacity(0.0),
                //             ),
                //           ],
                //         ),
                //       )
                //     : Text("nothing"),
              ],
            ),
            (checkBool == true)
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          TextFormField(
                              controller: searchctrl,
                              onTap: () {
                                setState(() {
                                  checkBool = !checkBool;
                                });
                              },
                              onChanged: (value) {
                                runfilter(value);
                              },
                              decoration: const InputDecoration(
                                  hintText: "Enter",
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                  ),
                                  //icon: const Icon(Icons.man_rounded),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5, color: Colors.green)))),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            //height: 150,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: foundTerm.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(),
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          foundTerm[index]["name"].toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 0.2,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            color: Colors.black.withOpacity(1),
                          ),
                        ],
                      ),
                    ),
                  )
                : Text("nothing"),
          ],
        ),
      ),
    ));
  }
}
