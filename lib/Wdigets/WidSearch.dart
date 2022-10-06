import 'package:flutter/material.dart';
import 'package:untitled/Home.dart';

Widget SearchWid(
  List found,
) {
  return Container(
    height: 110,
    color: Colors.white,
    child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: found.length,
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
                        found[index]["name"].toString(),
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
      ],
    ),
  );
}
