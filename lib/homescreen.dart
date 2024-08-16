import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final storage = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body : StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot){
          final userdata = snapshot.data?.docs;
          if (userdata!.isEmpty){
            return Center(child: Text("No Data."));
          }
          return ListView.builder(
            itemCount: userdata?.length,
            itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Text("UserEmail : ${userdata![index]["emailaddress"]}", style: TextStyle(fontStyle: FontStyle.italic),),
                    Text("Password : ${userdata[index]["password"]}", style: TextStyle(fontStyle: FontStyle.italic),),
                  ],),
                ),
              );
            }
          );
        },
      )
    );
  }
}