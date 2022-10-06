import 'dart:ui';
import "package:flutter/material.dart";
import 'package:untitled/Providers/Toggle.dart';

import 'Wdigets/WidSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool checkBool = false;
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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
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
              ),
              (checkBool == false)
                  ?
                  // foundTerm.isNotEmpty
                  //     ?
                  Stack(children: [
                      Expanded(
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
                    ])
                  // : const Text(
                  //     "No data Found kindly search some other keyword")
                  :
                  // foundTerm.isNotEmpty
                  //     ?
                  Stack(children: [
                      Expanded(
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
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.0),
                        ),
                      ),
                      TextFormField(
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
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)))),
                      SearchWid(foundTerm),
                    ]),
              // : const Text(
              //     "No data Found kindly search some other keyword")
            ],
          ),
        ]),
      ),
    );
  }

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
}
