import 'package:flutter/material.dart';

class StartingPageOne extends StatefulWidget {
  const StartingPageOne({super.key});

  @override
  State<StartingPageOne> createState() => _StartimgPageOneState();
}

class _StartimgPageOneState extends State<StartingPageOne> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 60),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Healthy", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),),
                        Text("Personal Health Guider", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.grey),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset('images/pic1.png'),
                  ),
                  Container(
                    height: 330,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 35),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xFF16FADF),
                          Colors.white
                        ],
                      ),
                    ),
                    // color: Colors.blueAccent,
                    child: Column(
                      children: [
                        const Text("Let’s Start Your Health Journey", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        const Text("Welcome", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 30,),
                        const Text("I’m your", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                        const Text("Personal", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                        const Text("Health Guider", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 20,),
                        Icon(Icons.abc, color: Colors.grey,),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/start2');
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),

                            child: const Center(child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),)), ),
                        )

                      ],
                    ),
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
