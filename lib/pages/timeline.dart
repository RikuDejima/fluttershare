import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection("users");

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    // getUserById();
    // getUsers();
    // createUser();
    // updateUser();
    deleateUser();
    super.initState();
  }

  createUser() {
    usersRef
        .document("asdfasfd")
        .setData({"username": "Jeff", "postCounts": 0, "isAdmin": false});
  }

  updateUser() {
    usersRef
        .document("asdfasfd")
        .updateData({"username": "Jhon", "postCounts": 0, "isAdmin": false});
  }

  deleateUser() {
    usersRef.document("asdfasfd").delete();
  }

  // getUsers() async {
  //   final QuerySnapshot snapshot = await usersRef.getDocuments();
  //
  //   setState(() {
  //     users = snapshot.documents;
  //   });

  // getUsers() async {
  //   final QuerySnapshot snapshot =
  //       await usersRef.orderBy("postsCount", descending: true).getDocuments();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);
  //   });
  // }

  // getUsers() {
  //   usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //       print(doc.documentID);
  //       print(doc.exists);
  //     });
  //   });
  // }

  // getUserById() async {
  //   final String id = "yDR5Ka4CoamT7q3jXEwK";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //   print(doc.data);
  //   print(doc.documentID);
  //   print(doc.exists);
  // }

  @override
  Widget build(
    context,
  ) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapshot.data.documents
                .map((doc) => Text(doc['username']))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          },
        ));
  }
}
