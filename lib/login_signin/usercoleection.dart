import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUser extends StatelessWidget {
  final String doucumentid;
  GetUser({Key? key, required this.doucumentid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      builder: (context, snapshot) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Row(
                children: [   Text("email:"),
                  Text("${data['email']}"),
               
                ],
              ), 
              Row(
                children: [ Text("firstName:"),
                  Text("${data['firstName']}"),
                 
                ],
              ), 
            ],
          );
        }
        return Text("loading");
      },
      future: users.doc(doucumentid).get(),
    );
  }
}
