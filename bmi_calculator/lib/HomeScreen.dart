// @dart=2.9


import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1
enum Gender{
  male,
  female
}
Gender selectGender;

const  kActiveColor=Color(0xff2b3131);
const kInactiveColor=Color(0xFFA5D6A7);

Color femaleCont=kInactiveColor;
Color maleCont=kActiveColor;
const klabelText=TextStyle(
  fontSize: 18.0
);
const kNumberText=TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);
int height=170;
 int weight=60;
int age=20;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculate Your BMI',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableContainer(
                          otp:(){
                            setState(() {
                              selectGender=Gender.male;
                              
                            });
                          },
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Icon(FontAwesomeIcons.male,size:75),
                          SizedBox(
                            height:10
                            ),
                          Text('MALE',style: TextStyle(fontSize: 18),),
                        ],),
                          contColor: selectGender==Gender.male? kInactiveColor:kActiveColor),
                    ),
                     Expanded(
                        child: ReusableContainer(
                          otp:(){
                            setState(() {
                              selectGender=Gender.female;
                            });
                          },
                          customChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Icon(FontAwesomeIcons.female,size:75),
                          SizedBox(
                            height:10
                            ),
                          Text('FEMALE',style: TextStyle(fontSize: 18),),
                        ],),contColor: selectGender==Gender.female?kInactiveColor:kActiveColor),
                    )

                  ],
                ),
              ),
              Expanded(

                    child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableContainer(contColor: kActiveColor,
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("SELECT HEIGHT",style: klabelText,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              
                              children: <Widget>[
                                Text(height.toString(),style: kNumberText,),
                                Text('CM',style: klabelText,),
                              ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape:RoundSliderThumbShape(enabledThumbRadius: 16.0),
                                  thumbColor: kInactiveColor,
                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.green
                                 

                                ),
                                 child: Slider(value: height.toDouble(),
                                min:120.0,
                                max:220.0,
                                 onChanged: (double changeHeight){
                                   setState(() {
                                     height=changeHeight.round();
                                   });
                                 }),
                              ),
                          ],
                        ),
                        ),
                    )

                  ],
                ),
              ),
              Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(

                        child: ReusableContainer(contColor: kActiveColor,
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("WEIGHT",style: klabelText,),
                            Text(weight.toString(),style: kNumberText,),
                            Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                              children: <Widget>[
                                
                                ButtonPlusMinus(
                                  
                                  buttonIcon: FontAwesomeIcons.minus,
                                  onpress: (){
                                    setState(() {
                                      weight--;
                                      
                                    });
                                }
                                ),
                                SizedBox(width:10.0),
                                ButtonPlusMinus(
                                  buttonIcon: FontAwesomeIcons.plus,
                                  onpress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),


                            ],)


                        ],),
                        ),
                    ),
                     Expanded(
                        child: ReusableContainer(contColor: kActiveColor,
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("AGE",style: klabelText,),
                            Text(age.toString(),style: kNumberText,),
                            Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                              children: <Widget>[
                                
                                ButtonPlusMinus(
                                    buttonIcon: FontAwesomeIcons.minus,
                                  onpress: (){
                                    setState(() {
                                      age--;
                                      
                                    });
                                }
                                
                                ),
                                SizedBox(width:10.0),
                                ButtonPlusMinus(
                                    buttonIcon: FontAwesomeIcons.plus,
                                  onpress: (){
                                    setState(() {
                                      age++;
                                      
                                    });
                                }
                                
                                ),


                            ],)


                        ],),),
                    )

                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Calculate c=new Calculate(height,weight);
                  });
                   Navigator.pushNamed(context, Myroutes.result);
                  
                },
                              child: Container(
                  child: Center(child:Text("CALCULATE",style: TextStyle(fontSize: 25),)),
                  height:75,
                  width:double.infinity,
                  color: Colors.green[900],
                  margin: EdgeInsets.only(top:18.0),
                  
                  
                ),
              )
              

            ],
          ),
        ));
  }
}

class ButtonPlusMinus  extends StatelessWidget {
  ButtonPlusMinus({this.buttonIcon,this.onpress});
  final IconData buttonIcon;
  final Function onpress;
 

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonIcon),
      onPressed: onpress,
      fillColor: kInactiveColor,
      constraints: BoxConstraints.tightFor(
        width: 44.0,
        height: 44.0,

      ),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0),),
      
    );
  }
}

class ReusableContainer extends StatelessWidget {
  ReusableContainer({@required this.contColor,this.customChild,this.otp});
  final Color contColor;
  final Widget customChild;
  final Function otp;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otp,
          child: Container(
        child: customChild,
      height: 180.0,
      width: 180.0,
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
      color: contColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
                        ),
    );  
  }
}
