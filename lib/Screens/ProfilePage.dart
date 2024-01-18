import 'package:flutter/material.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Screens/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  
  var user;
  var name = '';
  var email = '';
  var auth = FirebaseAuth.instance;
  var uid;
  getUserDetails()async{
    uid = auth.currentUser!.uid;
    user = await getUser(uid: uid);
    setState(() {
      name = user['name'];
      email = user['email'];
    });
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
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset('images/Clipped.png',fit: BoxFit.cover,),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text("$name", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
                      Text("$email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,),),

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    auth.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(20, 400, 20, 0),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text("Logout", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    var res = await deleteUser(docId: uid);
                    print(res.message);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text("Delete Account", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
