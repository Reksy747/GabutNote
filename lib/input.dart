import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class input extends StatefulWidget {
  @override
  _inputState createState() => _inputState();
}

class _inputState extends State<input> {
  final judul = new TextEditingController();
  final ini = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
        submit();
      },
        child: Icon(Icons.check),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.orange,
          height: 25,
        ),
      ),
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("GabutNote"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: Color(0xb3ffffff)
                  ),
                  child: TextField(
                    controller: judul,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Judul',
                        fillColor: Colors.white,
                        focusColor: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: Color(0xb3ffffff)
                  ),
                  child: TextField(
                    maxLines: 11,
                    controller: ini,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Isi Note...',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  submit() async {
    // setState(() {
    //
    // });
    print("************************************");
    print(judul.text + "\n\n\n" + ini.text);
    Firestore.instance.collection('notes').document().setData({ 'judul': judul.text, 'ini': ini.text});
    Navigator.pop(context);
  }
}
