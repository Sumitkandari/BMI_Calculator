import 'dart:math';

class Calculate{

  Calculate(this.height,this.weight){
    double temp;
    temp=weight/pow(height/100,2);
    result=double.parse(temp.toStringAsFixed(1));
    
  }
  final int weight;
  final int height;
  static double result;
  static String msg;
  static String des;
  
  static String getDesc(bool temp){
    if(result>25){
      msg="Over Weight";
      des ="You have more weight";
    }
    else if(result>18.5){
      msg="Normal";
      des= "You have Normal weight";
    }
    else{
      msg="Under Weight";
      des= "You have  Under weight";
    }
    if(temp)  return des;
    else return msg;
      
    
  }

}