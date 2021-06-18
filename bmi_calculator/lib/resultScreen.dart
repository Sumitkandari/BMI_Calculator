import 'package:flutter/material.dart';
import 'calculate.dart';
//import 'resultScreen.dart';
class ResultScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("BMI Result"),

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex:1,
            child: Text(
              "Your Result Is",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color:Colors.white
              ),
            ),),
            Expanded(
                flex:5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("${Calculate.result}",style: TextStyle(color: Colors.green[900],fontSize: 50,fontWeight:FontWeight.bold),),
                  Text("${Calculate.getDesc(false)}",style:TextStyle(color:Colors.red[900],fontSize: 40)),
                  Text("${Calculate.getDesc(true)}",style:TextStyle(fontSize:30 )),
                ],
                
                )),
                Expanded(child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    color: Colors.green[900],
                    height: 75,
                   
                    child: Text(
                      "Recalculate",
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 25.0
                      ),
                    ),
                  ),
                ))

        ],
      )
    );
      
    
  }
}