import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_crud_flutter/add_student_page.dart';
import 'package:firestore_crud_flutter/database.dart';
import 'package:firestore_crud_flutter/list_student_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Firestore CRUD'),
            // ElevatedButton(
            //     onPressed: ()=>{
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage()))
            //     }, child: Text('Add',style: TextStyle(fontSize: 20)),
            //   style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            // )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}




