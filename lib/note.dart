import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'input.dart';
class note extends StatefulWidget{

  @override
  _noteState createState() => _noteState();
}
class _noteState extends State<note> {

  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        transport(input());
      },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.orange,
          height: 40,
        )
      ),
      appBar:  AppBar(title: Text("GabutNote"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('notes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState){
            case ConnectionState.waiting: return new Text('Loading.....');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.grey,
                      child: new ListTile(
                        title: new Text(document['judul'],style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                        subtitle: new Text(document['ini'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      )
    );
  }
  transport (Widget n){
    Navigator.push(context, MaterialPageRoute(builder: (context) => n));
  }
}