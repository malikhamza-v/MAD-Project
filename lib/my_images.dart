import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyImage extends StatefulWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  var firestoreDB = FirebaseFirestore.instance.collection("media").snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: Image.file(File(snapshot
                                            .data!.docs[index]['name'])));
                                  });
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Image.file(
                                  File(snapshot.data!.docs[index]['name']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(child: Icon(Icons.delete),
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .runTransaction((Transaction
                                                  myTransaction) async {
                                            myTransaction.delete(snapshot
                                                .data!.docs[index].reference);
                                          });
                                        },
                                        ),
                        ],
                      );
                    }));
          },
        ),
      ),
    );
  }
}
