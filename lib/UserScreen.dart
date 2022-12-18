import 'package:api_demo/list.dart';
import 'package:flutter/material.dart';
class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  State<UserInterface> createState() => _UserInterfaceState();
}
class _UserInterfaceState extends State<UserInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Night Vision",style: TextStyle(color: Colors.black),),centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: () {  },),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
    children: [
        MyContainer(title: "Night Vision Mode"),
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Container(
            height: 355,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(20)
            ),
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(0.0),
                         child: Text("Schedule night mode",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       ),
                       Spacer(),
                       SwitchScreen()
                     ],
                   ),
                   ),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("Start Time",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                       child: MyTimer(),
                     ),
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("Stop Time",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                       child: MyTimer(),
                     ),
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text("Days to Repeat",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 16,top: 0,bottom: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "M"),
                       ),
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "Tu"),
                       ),
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "W"),
                       ),
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "Th"),
                       ),
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "F"),
                       ),
                       Padding(padding:EdgeInsets.only(right: 16),
                         child: Days(day: "Sa"),
                       ),
                       Padding(padding: EdgeInsets.only(right: 16),
                         child: Days(day: "Su"),
                       ),
                     ],
                   ),
                 )


               ],
             ),

        ),
         ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16,),
          child: MyContainer(title: "Automatic mode"),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 300,
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListData()));
            }, child: Text("Save",style: TextStyle(color: Colors.white),
            ),style: ButtonStyle(backgroundColor:  MaterialStatePropertyAll<Color>(Colors.green),),
            ),
          ),
        )

    ],
        ),
      )
    );
  }
}
class MyContainer extends StatelessWidget {
  String title;
   MyContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(16),
      child:Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            Spacer(),
            SwitchScreen()
          ],
        ),
      ),
      )
    );
  }
}
class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1,
        child: Switch(
          onChanged: toggleSwitch,
          value: isSwitched,
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
        )
    );
  }
}
class MyTimer extends StatefulWidget {
   MyTimer({Key? key}) : super(key: key);

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  String value="";
  String dropdownvalue = 'AM';

  // List of items in our dropdown menu
  var items = [
    "AM",
    "PM"
  ];
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("10:15",style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
class Days extends StatelessWidget {
  late String day;
  Days({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border:Border.all(color: day=="W"|| day=="F"?Colors.green:Colors.grey.shade300,width: 1)
      ),
      child: CircleAvatar(
        radius: 13,
        backgroundColor: day=="W"|| day=="F"?Colors.white:Colors.grey.shade300,
        child: Center(child: Text(day,style: TextStyle(color: day=="W"|| day=="F"?Colors.green:Colors.grey),)),
      ),
    );
  }
}
