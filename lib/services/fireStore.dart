import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Employee');

// Created the classes
class Response{
  int? code;
  String? message;
  // Add the constructor
  Response({this.code,this.message});
}

class User{
  String? name;
  int? age;
  String? email;
  String? password;
  String? Uid;
}

class HealthData{
  double? height;
  double? weight;
  String? bloodPressure;
  String? cholesterolLevel;
  String? bloodSugar;
  String? heartRate;
}

// regiter functionality
registerUser({required String name, required String email, required String password}) async{
  DocumentReference documentReferencer = _Collection.doc();
  Response response = Response();
  User user1 = User();
  user1.email = email;
  user1.name = name;
  user1.password = password;
  try{
      var res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Map<String, dynamic> data = <String, dynamic>{
        'uid' : res.user!.uid,
        "name": name,
        "email": email
      };
      var result = await documentReferencer.set(data).whenComplete(() {
        response.code = 200;
        response.message  = "Registration Successfully";
      }).catchError((e){
        response.code = 201;
        response.message = "Registration Failed;";
      });
    return response;
  }catch(e){
    response.code = 201;
    response.message = "$e";
    return response;
  }

}


loginUser ({required String email, required String password})async{
  try{
    var res =await _auth.signInWithEmailAndPassword(email: email, password: password);
    return res;
  }catch(e){

  }
}

// Details adding page
addUserDetails({
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

// Adding health records
updateHealthrecords({
  required int bloodpressure,
  required int bloodsugure,
  required int cholestorollevel,
  required int hartrate,
  required String docId,
  required double height,
  required double weight,

}) async {

  QuerySnapshot querySnapshot = await _Collection.where('uid', isEqualTo: docId).get();
  docId = querySnapshot.docs.first.id;

  updateUserList(bloodpressure: bloodpressure, bloodsugure: bloodsugure, cholestorollevel: cholestorollevel, hartrate: hartrate, docId: docId);

  Response response = Response();
  DocumentReference documentReferencer =
  _Collection.doc(docId);

  var data = <String, dynamic>{
    "blood pressure": bloodpressure,
    "blood sugar": bloodsugure,
    "cholesterol level": cholestorollevel,
    "heart rate": hartrate,
    'weight' : weight,
    'height' : height
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


addHealthrecords({
  required int bloodpressure,
  required int bloodsugure,
  required int cholestorollevel,
  required int hartrate,
  required String docId,

}) async {

  QuerySnapshot querySnapshot = await _Collection.where('uid', isEqualTo: docId).get();
  docId = querySnapshot.docs.first.id;

  Response response = Response();
  DocumentReference documentReferencer =
  _Collection.doc(docId);

  var data = <String, dynamic>{
    "blood pressure": bloodpressure,
    "blood sugar": bloodsugure,
    "cholesterol level": cholestorollevel,
    "heart rate": hartrate,
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

getOpneai({required String? prompt}) async{
  await dotenv.load();
  final responce = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      "Content-Type": "application/json",
      "Authorization" : "Bearer ${dotenv.env['token']}"
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": "You are a helpful assistant."
        },
        {
          "role": "user",
          "content": "$prompt"
        }
      ]
    })
  );
  print(json.decode(responce.body)['choices'][0]['message']['content']);
  var para = (json.decode(responce.body)['choices'][0]['message']['content']).split(RegExp(r'\d+\.'));
  para = para.map((sentence) => sentence.trim()).toList();
  return para;



}


getUser({required String uid})async{
  final employees =  await _firestore.collection("Employee").get();
  for(var employee in employees.docs){
    if(employee.data()["uid"] == uid){
      return employee.data();
    }
  }
}


// Not in use Currently
saveTips(List<String> usernames, String docId)async {
  QuerySnapshot querySnapshot = await _Collection.where('uid', isEqualTo: docId).get();
  docId = querySnapshot.docs.first.id;

  Response response = Response();
  DocumentReference documentReferencer =
  _Collection.doc(docId);
  var data = <String, dynamic>{
    "tips": usernames,
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



Future<List<String>> getHealthTips({required String id, required String condition}) async {
  final employees = await _firestore.collection("Employee").get();

  for (var employee in employees.docs) {
    if (employee.data()['uid'] == id) {
      String prompt =
          "My $condition is ${employee.data()['$condition']}. Give me 3 health tips regarding my ${employee.data()['$condition']} value. Give me those three tips as separate 3 paragraphs. One paragraphs only contains one sentence. Sentence must have maximum 5 words";
      dynamic openaiResponse = await getOpneai(prompt: prompt);

      List<String> stringList = [];
      if (openaiResponse is Iterable) {
        stringList = List<String>.from(openaiResponse.map((item) => item.toString()));
      } else {

        stringList = [openaiResponse.toString()];
      }

      return stringList;
    }
  }


  return [];
}


Future<List<String>> getMealPlan({required String id}) async {
  final employees = await _firestore.collection("Employee").get();

  for (var employee in employees.docs) {
    if (employee.data()['uid'] == id) {
      String prompt =
          "Give me a meal plan for one day. Give it as separate three part for breakfast, lunch and dinner in separate sections. Don't include emojis.";
      dynamic openaiResponse = await getOpneai(prompt: prompt);


      List<String> stringList = [];
      if (openaiResponse is Iterable) {
        stringList = List<String>.from(openaiResponse.map((item) => item.toString()));
      } else {

        stringList = [openaiResponse.toString()];
      }

      return stringList;
    }
  }


  return [];

}

updateUserList(
{required int bloodpressure,
  required int bloodsugure,
  required int cholestorollevel,
  required int hartrate,
  required String docId,}
    )async{
  final employees = await _firestore.collection("Employee").get();
  
  for(var employee in employees.docs){
    if(employee.data()['id'] == docId){
      List<dynamic> bloodpressureList = [];
      List<dynamic> bloodSugarList = [];
      if(employee.data()['blood pressure list'] == null){
        bloodpressureList.add(bloodpressure);
        bloodSugarList.add(bloodsugure);
      }else{
        bloodpressureList = [...employee.data()['blood pressure list']];
        bloodSugarList = [...employee.data()['blood sugar list']];
      }



      Response response = Response();
      DocumentReference documentReferencer =
      _Collection.doc(docId);

      var data = <String, dynamic>{
        "blood pressure list": bloodpressureList,
        "blood sugar list": bloodSugarList,

      };
      try{
        await documentReferencer.update(data);
        print("Successfully Created the List");
      }catch(e){
        print(e);
      }
    }
  }

}
// Delete a User
deleteUser({
required String docId,
}) async {
Response response = Response();
DocumentReference documentReferencer =
_Collection.doc(docId);

await documentReferencer
    .delete()
    .whenComplete((){
response.code = 200;
response.message = "Sucessfully Deleted User";
})
    .catchError((e) {
response.code = 500;
response.message = e;
});

return response;
}

