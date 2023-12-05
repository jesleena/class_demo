import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: OrientationEx(),));
}
class OrientationEx extends StatelessWidget {
 var height,width,orintation;

  @override
  Widget build(BuildContext context) {
    orintation=MediaQuery.of(context).orientation;//to get orientation of our app
    //MediaQuery.of(context).size
    // size of window
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Orientation MediaQuery"),),//condition?stmt1:stmt2
      body: orintation==Orientation.portrait?Container(
        height: height/2,
        width: width/2,
        color: Colors.red,
      ):Container(
        height: height/4,
        width: width,
        color: Colors.red,
      ),

    );
  }
}
