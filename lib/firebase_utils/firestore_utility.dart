import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/ui/model/event_dm.dart';

import '../ui/model/user_dm.dart';

Future<void> createUserInFirestore(UserDM user) async {
  var userCollection = FirebaseFirestore.instance.collection("users");
  // userCollection.add();
  var emptyDoc = userCollection.doc(
    user.id,
  ); // create or search for doc with id
  emptyDoc.set(user.toJson());

  ///JSON
}

Future<UserDM> getUserFromFirestore(String uid) async {
  var userCollection = FirebaseFirestore.instance.collection("users");
  DocumentSnapshot snapshot = await userCollection.doc(uid).get();
  Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
  return UserDM.fromJson(json);
}

createEventInFirestore(EventDM event) async {
  CollectionReference collection = FirebaseFirestore.instance.collection(
    "events",
  );

  ///Solution 1
  // var documentRef = await collection.add(eventDM.toJson());
  // documentRef.update({"id": documentRef.id});
  ///Solution 2
  var documentRef = collection.doc();
  event.id = documentRef.id;

  ///Create empty
  await documentRef.set(event.toJson());
}

Stream<List<EventDM>> getEventsFromFirestore(){
  CollectionReference collection = FirebaseFirestore.instance.collection("events");
  // QuerySnapshot querySnapshot =  collection.get(); ///Get all events from collection
  // ///
  // return querySnapshot.docs.map((doc){
  //   var json = doc.data() as Map<String, dynamic>;
  //   return EventDM.fromJson(json);
  // }).toList();
  Stream<QuerySnapshot> stream =  collection.snapshots(); ///Get all events from collection
  return stream.map((querySnapshot){
    return querySnapshot.docs.map((doc){
      var json = doc.data() as Map<String, dynamic>;
      return EventDM.fromJson(json);
    }).toList();
  });
}
