import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_crud_flutter/update_student_page.dart';
import 'package:flutter/material.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);
  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {

  final Stream<QuerySnapshot> FarmersStream =
      FirebaseFirestore.instance.collection('farmers').snapshots();

  // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  // final now = DateTime.now();
  //Delete function:
  // CollectionReference farmers =
  //     FirebaseFirestore.instance.collection('farmers');
  // Future<void> deleteUser(id) async {
  //   return farmers
  //       .doc(id)
  //       .delete()
  //       .then((value) => print('user Deleted'))
  //       .catchError((error) => print('Failed to delete  user: $error'));
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FarmersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            print('Map'+ a.toString());
            storedocs.add(a);
            print('storedocs'+ storedocs.toString());
            print('storedocs quantity'+ storedocs[0]['quantity'].toString());
            print('Something'+DateTime.parse(storedocs[0]['timestamp'].toDate().toString()).toString());
          }).toList();

          return Scaffold(
            body: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      height: 100,
                      child: Card(
                        child: ListTile(
                          trailing: Text('Amount: ' +
                              storedocs[index]['amount'].toString()),
                          title: Text('Name: ' + storedocs[index]['name']), subtitle: (storedocs[index]['quantity'].toString() == 'null')
                              ? const Text('Quantity: ')
                              : Text('Quantity: ' +
                                  storedocs[index]['quantity'].toString()),
                           leading: Text('timestamp: '+DateTime.parse(storedocs[0]['timestamp'].toDate().toString()).toString()),
                          //leading-->buyer/seller
                          //subtitle in row--> qty and price
                          //trailing-->timestamp
                        ),
                      ),
                    ),
                  ]);
                }),
          );
        });
  }
}
