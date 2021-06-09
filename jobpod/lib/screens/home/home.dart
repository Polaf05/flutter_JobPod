import 'package:flutter/material.dart';
import 'package:jobpod/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:(Column(
              children: [
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.12,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                    color: Color(0xFFD2F9DB),
                    child: Row(
                      children: [
                        Container(child:Image(image: AssetImage("assets/JobPod.png"), width: 120, height: 50)),
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 0, 0, 5),
                          child: Row(
                            children: [
                              Container(child:Image(image: AssetImage("assets/search icon.png"), width: 90, height: 25)),
                              Container(child:Image(image: AssetImage("assets/burger icon.png"), width: 50, height: 25)),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  
                ],),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                  color: Color(0xFFE8FFED),
                  child: 
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(child:Image(image: AssetImage("assets/home icon.png"), width: 70, height: 25)),
                        Container(child:Image(image: AssetImage("assets/profile icon.png"), width: 70, height: 25)),
                        Container(child:Image(image: AssetImage("assets/bell icon.png"), width: 70, height: 25)),
                        Container(child:Image(image: AssetImage("assets/mail icon.png"), width: 70, height: 25)),
                      ],
                    ),
                    )
                ),
                
                Container(
                  child:TextButton(
                    onPressed: () {
                      AuthService().signOutUser();
                    },
                    child: Text(
                      "Log Out",
                    ),
                  ),
                )
              ],
            )
          )
          
        )
      ),
    );
  }
}
