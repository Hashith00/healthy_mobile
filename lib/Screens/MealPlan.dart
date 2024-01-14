import 'package:flutter/material.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';

class MealPaln extends StatefulWidget {
  const MealPaln({super.key});

  @override
  State<MealPaln> createState() => _MealPalnState();
}

class _MealPalnState extends State<MealPaln> {
  bool content = false;
  var user;
  bool _saving = false;
  var name = "";
  var entries = [];
  var temp = [];


  getUserDetails() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    user = await getUser(uid: auth.currentUser!.uid);
    print(user);
    setState(() {
      name = user["name"];
    });
    var res = await getMealPlan(id: auth.currentUser!.uid);
    setState(() {
      for(String plan in res){
        entries.add(plan);
      }
      content = true;
    });
    print(temp.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _saving,
          color: Colors.black,
          blur: 3.5,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(30, 10, 0, 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Hello $name",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Here is the Suggested meal plan for you",
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    child: content
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: entries.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        color: Colors.grey.shade300),
                                    child: Column(
                                      children: [
                                        Text("Meal Plan", style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          child: Text(
                                            '${entries[index]}',
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        : Container(
                            child: SizedBox(
                              width: double.infinity,
                              height: 100.0,
                              child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade400,
                                  highlightColor: Colors.grey,
                                  child: Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey),
                                      margin: EdgeInsets.all(20),
                                      width: double.infinity,
                                      height: 55.0,
                                    ),
                                  ])),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
