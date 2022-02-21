import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  // var firestoreDB = FirebaseFirestore.instance.collection("test").snapshots();

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  TextEditingController control6 = TextEditingController();
  TextEditingController control7 = TextEditingController();
  TextEditingController control8 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String id;

  //CollectionReference ref=FirebaseFirestore.instance.collection("test");

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Private Space of doctor"),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('test').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (ctx, index) => SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 9, left: 9, right: 9),
                              child: ListTile(
                                title: Text(
                                  streamSnapshot.data!.docs[index]
                                      ['Patient Name'],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      streamSnapshot.data!.docs[index]
                                          ['Address'],
                                    ),
                                    Text(
                                      streamSnapshot.data!.docs[index]
                                          ['Contact'],
                                    ),
                                  ],
                                ),
                                tileColor: Colors.blueGrey,
                                leading: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // print(streamSnapshot.data!.docs[index].id);
                                    setState(() {
                                      id = streamSnapshot.data!.docs[index].id;
                                      control6.text = streamSnapshot
                                          .data!.docs[index]['Patient Name'];
                                      control7.text = streamSnapshot
                                          .data!.docs[index]['Address'];
                                      control8.text = streamSnapshot
                                          .data!.docs[index]['Contact'];
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: ListView(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 28.0, right: 28.0,top: 29.0),
                                              child: TextFormField(
                                                //  initialValue: widget.fgf,
                                                controller: control6,

                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .drive_file_rename_outline),
                                                  labelText:
                                                      "Enter a patient Name",
                                                ),
                                                onSaved: (value) {
                                                  //name=value;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 28.0, right: 28.0),
                                              child: TextFormField(
                                                controller: control7,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .add_location_rounded),
                                                  labelText: "Address",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 28.0, right: 28.0),
                                              child: TextFormField(
                                                controller: control8,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons
                                                      .phone_bluetooth_speaker),
                                                  labelText: "Contact Number",
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 38.0,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("test")
                                                    .doc(id)
                                                    .update({
                                                  "Patient Name": control6.text,
                                                  "Address": control7.text,
                                                  "Contact": control8.text,
                                                  "UpdatedAt": DateTime.now(),
                                                });
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                                  'Your data have updated'
                                                )));

                                                control6.clear();
                                                control7.clear();
                                                control8.clear();
                                              },
                                              child: Text("Data Have been Updated"),
                                            ),
                                            SizedBox(
                                              height: 18.0,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("test")
                                                    .doc(id)
                                                    .delete();
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                                    'Data have been Deleted'
                                                )));

                                                //({
                                                //   "Patient Name": control6
                                                //       .text,
                                                //   "Address": control7
                                                //       .text,
                                                //   "Contact": control8
                                                //       .text,
                                                //   "UpdatedAt": DateTime
                                                //       .now(),
                                                // });
                                              },
                                              child: Text("Delete Data"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
