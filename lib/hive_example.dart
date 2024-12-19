import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Hivepage extends StatefulWidget{
  @override
  State<Hivepage> createState()=> _hiveexampleState();
}

class _hiveexampleState extends State<Hivepage>{
  
  late Box box;
  String? username;

  @override
  void initState(){
    super.initState();
    box = Hive.box("mybox");
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive data Storage",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 40,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 212, 212, 212)
                  ),
                  onPressed: (){
                    box.put("name", "John doe");
                  }, child: Text("Store Data",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),)),
            ),
        
            SizedBox(height: 30,),
        
            Center(
              child: SizedBox(
                height: 40,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 212, 212, 212)
                  ),
                  onPressed: (){
                    setState(() {
                      username=box.get("name");
                    });
                  }, child: Text("Retrive Data",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),)),
            ),

            SizedBox(height: 60,),

            Center(child: Text(
              username != null ? "Stored Username: $username" : "No data yet",style: TextStyle(fontSize: 20,color: Colors.black),))
          ],

        ),
      ),
    );
  }
}