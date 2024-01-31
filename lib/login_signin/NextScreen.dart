import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms/login_signin/usercoleection.dart';
import 'package:tms/themes/theme_provider.dart';

class NextScreen extends StatefulWidget {
  NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  List<String> docs = [];
  late User? user;
  late Future<void> userProfile;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    userProfile = FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
           
              print(element.reference);
              docs.add(element.reference.id);
              print(docs);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeStateProvider>().setDarkTheme();
            },
            icon:
                context.select((ThemeStateProvider theme) => theme.isDarkTheme)
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: userProfile,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return GetUser(doucumentid: docs[index],);
            },
          );
        },
      ),
    );
  }
}
