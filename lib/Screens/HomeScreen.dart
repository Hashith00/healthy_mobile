import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:untitled/Screens/Home.dart';
import 'package:untitled/Screens/editprofile.dart';
import 'package:untitled/Screens/HeartRateDetails.dart';
import 'package:untitled/Screens/MealPlan.dart';
import 'package:untitled/Screens/ProfilePage.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  var name = "name";
  var currentuser = {};

  int _selectedIndex = 0;
  @override

  late List<Widget> _tabComponents; // Declare _tabComponents as a late variable

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
    _initializeTabComponents();
  }

  Future<void> _fetchCurrentUser() async {
    try {
      // Assuming getUser returns a Map<dynamic, dynamic>
      Map<dynamic, dynamic> userMap = await getUser(uid: user.uid);
      setState(() {
        currentuser = userMap;
        _initializeTabComponents(); // Move the initialization here
      });
    } catch (error) {
      // Handle errors if necessary
      print("Error fetching user data: $error");
    }
  }

  void _initializeTabComponents() {
    _tabComponents = [
      Health(user: currentuser),
      MealPaln(),
      EditProfile(),
      ProfilePage(),
    ];

    print(currentuser); // Now, it should print the fetched user data
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child:Container(
            color: Color(0xFFededed),
            width: double.infinity,
            height: double.infinity,
            child: _tabComponents[_selectedIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
           backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.house, color: Colors.grey,),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(BoxIcons.bx_bowl_hot, color: Colors.grey,),
              label: 'Meal Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.pen_to_square, color: Colors.grey,),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.user,color: Colors.grey,),
              label: 'Profile',
            ),



          ],
         selectedItemColor: Colors.black,
         currentIndex: _selectedIndex, //New
          onTap: (index){
             setState(() {
               _selectedIndex = index;
             });
          },
        ),

      ),
    );
  }
}

