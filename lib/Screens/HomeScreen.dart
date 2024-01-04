import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: HomeWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
           backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.house, color: Colors.grey,),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.bar_chart, color: Colors.grey,),
              label: 'Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Bootstrap.bar_chart, color: Colors.grey,),
              label: 'Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(BoxIcons.bx_bowl_hot, size: 30,color: Colors.grey,),
              label: 'Meal Plan',
            ),



          ],
         selectedItemColor: Colors.black,
         currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Text(
                "Stephanie ",
                style:
                    TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "3 Days ago",
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  HealthRecord(recordvalue: 50,recordName: "Blood Pressure",icon: Bootstrap.heart_pulse,measuringUnite: "mmHg", backgroundColor: Color(0xFF58FF56),),
                  HealthRecord(recordvalue: 70, recordName: "Sugar Level", icon: Bootstrap.heart_pulse_fill, measuringUnite: "mg/dL",backgroundColor: Color(0xFF58FF56),)
                ],
              ),
              Row(
                children: [
                  HealthRecord(recordvalue: 50,recordName: "Blood Pressure",icon: Bootstrap.heart_pulse,measuringUnite: "mmHg", backgroundColor: Color(0xFF58FF56),),
                  HealthRecord(recordvalue: 70, recordName: "Sugar Level", icon: Bootstrap.heart_pulse_fill, measuringUnite: "mg/dL",backgroundColor: Color(0xFF58FF56),)
                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}

class HealthRecord extends StatelessWidget {
  const HealthRecord({
    super.key,
    required this.recordvalue,
    required this.recordName,
    this.icon = Icons.abc,
    required this.measuringUnite,
    required this.backgroundColor,

  });
  final int recordvalue;
  final String recordName;
  final IconData icon;
  final String measuringUnite;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.black;
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor,),
              Text(
                "  $recordName",
                style: TextStyle(fontSize: 15, color: textColor),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$recordvalue",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w700, color: textColor),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                "mmHg",
                style: TextStyle(fontSize: 15, color: textColor),
              )),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.only(left: 100),
              child: Icon(Bootstrap.three_dots, size: 40,color: textColor,),
            ),
          )
        ],
      ),
    ));
  }
}
