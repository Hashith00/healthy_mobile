import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';


class CholesterolDeatils extends StatefulWidget {
  const CholesterolDeatils({super.key});

  @override
  State<CholesterolDeatils> createState() => _CholesterolDeatilsState();
}

class _CholesterolDeatilsState extends State<CholesterolDeatils> {
  bool content = false;
  List<String> entries = [];
  var condition;
  var color = Colors.white;

  getdata ()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    var userdetails = await getUser(uid: user!.uid);
    print(userdetails['cholesterol level'].runtimeType);
    if((userdetails['cholesterol level'])< 200){
      setState(() {
        condition = "Good Condition";
        color = Colors.green.shade400;
      });

    }else{
      setState(() {
        condition = "In Margin";
        color = Colors.yellow.shade700;
      });
    }

    var tips = await getHealthTips(id: user!.uid, condition: 'cholesterol level');
    print(tips[0].runtimeType);
    for(String tip in tips){
      setState(() {
        entries.add(tip);
        content = true;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    getdata();


  }

  var _saving = false;
  //final List<String> entries = <String>['Im offering a valuable, informative class thats worth hundreds of dollars for free, and it is very useful.', 'B', 'C'];
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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/pgreen.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton.small(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.black,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        child: Image.asset('images/bp.png'),
                      ),
                      const Text(
                        "Cholesterol Level",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 35),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color),
                    child: Text(
                      "$condition",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "TIPS fOR STAY MORE HEALTHY",
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline),
                    ),
                  ),
                  Container(
                      child: content? Expanded(
                        child: ListView.builder(
                            itemCount: entries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: color),
                                child: Center(
                                  child: Container(
                                    child: Text('${entries[index]}', style: TextStyle(color: Colors.white, fontSize: 16),),
                                  ),
                                ),
                              );
                            }),
                      ) : Container(
                          child:SizedBox(
                            width: double.infinity,
                            height: 100.0,
                            child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade400,
                                highlightColor: Colors.grey,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.grey
                                      ),
                                      margin: EdgeInsets.all(20),
                                      width: double.infinity,
                                      height: 55.0,
                                    ),

                                  ],
                                )
                            ),
                          )
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
