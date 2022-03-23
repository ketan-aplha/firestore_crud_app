import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization= Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('hello');
    return FutureBuilder(
          future: _initialization,
        builder:(context,snapshot){
          if(snapshot.hasError){
            print('Something went wrong');
          }
          if(snapshot.connectionState ==ConnectionState.done){
            return MaterialApp(
              title: 'Flutter Firestore CRUD',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          }
          return CircularProgressIndicator();
        },

        );

  }
}

