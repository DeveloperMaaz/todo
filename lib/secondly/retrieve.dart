import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class retrieve extends StatelessWidget {
  var firestoreDB = FirebaseFirestore.instance.collection("test").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Appointments")),
        ),
        body:

        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('test').
          //orderBy('createdTime',descending: false)
           snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if(streamSnapshot.hasData){
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 9),



                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.person_rounded,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  streamSnapshot.data!.docs[index]
                                      ['Patient Name'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });}
            else return Center(
              child: CircularProgressIndicator(),
            );
          },
        )




    );
  }
}

/*

    return Scaffold(
    body: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('test')
        .snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    return ListView.builder(
    itemCount: streamSnapshot.data!.docs.length,
    itemBuilder: (ctx, index) =>
    Text(streamSnapshot.data!.docs[index]['text']),
    );
    },
    ));
    }
    }


//
//     new StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('test').docs.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return new Text('Loading...');
//           return new ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               return new ListTile(
//                 title: new Text(document['Name']),
//                 subtitle: new Text(document['contact']),
//               );
//             }).toList(),
//           );
//         });
//   }
// }





*/
