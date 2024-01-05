import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Employee');


class Response{
  int? code;
  String? message;
  Response({this.code,this.message});
}

// regiter functionality
registerUser({required String name, required String email, required String password}) async{
  DocumentReference documentReferencer = _Collection.doc();
  Response response = Response();
  try{
      var res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Map<String, dynamic> data = <String, dynamic>{
        'uid' : res.user!.uid,
        "name": name,
        "email": email,
        "password" : password
      };
      var result = await documentReferencer.set(data).whenComplete(() {
        response.code = 200;
        response.message  = "Login Successfull";
      }).catchError((e){
        response.code = 201;
        response.message = "resistration Nusuccessfull;";
      });
    return response;
  }catch(e){
    return e;
  }

}

// TODO : Need make some improvements
loginUser ({required String email, required String password})async{
  try{
    var res =await _auth.signInWithEmailAndPassword(email: email, password: password);
    return res;
  }catch(e){

  }
}

// Details adding page
addHealthRecords({
  required int age,
  required double height,
  required double weight,
  required String docId,
}) async {

  QuerySnapshot querySnapshot = await _Collection.where('uid', isEqualTo: docId).get();
  docId = querySnapshot.docs.first.id;

  Response response = Response();
  DocumentReference documentReferencer =
  _Collection.doc(docId);

  var data = <String, dynamic>{
    "age": age,
    "height": height,
    "weight": weight,
  };

  try {
    await documentReferencer.update(data);
    response.code = 200;
    response.message = "Updated the user";
  } catch (e) {
    response.code = 500;
    response.message = "Error updating user: $e";
  }

  return response.message;
}

class Employee{
  String? uid;
  String? employeename;
  String? position;
  String? contactno;

  Employee({this.uid,this.employeename,this.position,this.contactno});
}




class FirebaseCrud {
//CRUD method here

  // Create Record
  Future<Response> addEmployee({
    required String name,
    required String position,
    required String contactno,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "employee_name": name,
      "position": position,
      "contact_no" : contactno
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  // Update document



}