import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';


class HeartrateDetails extends StatefulWidget {
  const HeartrateDetails({super.key});

  @override
  State<HeartrateDetails> createState() => _HeartrateDetailsState();
}

class _HeartrateDetailsState extends State<HeartrateDetails> {
  bool content = false;
  List<String> entries = [];
  var condition;
  var color = Colors.white;

  getdata ()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    var userdetails = await getUser(uid: user!.uid);
    print(userdetails['heart rate'].runtimeType);
    if((userdetails['heart rate'])> 60 && (userdetails['heart rate'])< 100){
        setState(() {
          condition = "Good Condition";
          color = Colors.green.shade400;
        });

    }else{
      setState(() {
        condition = "Not in good condition";
        color = Colors.red.shade700;
      });
    }

    var tips = await getHealthTips(id: user!.uid, condition: 'heart rate');
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
                    image: AssetImage("images/pred.png"),
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
                        width: 60,
                        child: Image.asset('images/heart.png'),
                      ),
                      Text(
                        "Heart Rate",
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
                        color: Color(0xFFFF5353)),
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
                                  color: Color(0X1FFF5353)),
                              child: Center(
                                child: Container(
                                  child: Text('${entries[index]}', style: TextStyle(color: Colors.black, fontSize: 18),),
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
