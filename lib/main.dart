import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uichallengeexerciseapp/constants.dart';
import 'package:uichallengeexerciseapp/screens/Meditaion_details.dart';

import 'Widgets/Bottom_Navigation.dart';
import 'Widgets/SearchBar.dart';
import 'Widgets/category_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditaion App',
      theme: ThemeData(
        fontFamily: "Cario",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              title: "Today",
              svgScr:"assets/icons/calendar.svg" ,
            ),
            BottomNavItem(
              title: " All Exercises ",
              svgScr:"assets/icons/gym.svg" ,
              isActive: true,
            ),
            BottomNavItem(
              title: "Settings",
              svgScr:"assets/icons/Settings.svg" ,
            ),
          ],


        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height*.5,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),

                image: DecorationImage(image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                  fit: BoxFit.contain
              )
            ),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child:Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),

                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("Good Morning \nSam Baby",
                    style: Theme.of(context).textTheme.
                    display1.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  SearchBar(),
                  Expanded(

                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                     children: <Widget>[
                       CategoryCard(
                         title: "Diet Recommendation",
                         svgSrc: "assets/icons/Hamburger.svg",
                         press: () {},
                       ),
                       CategoryCard(
                         title: "Kegel Exercises",
                         svgSrc: "assets/icons/Excrecises.svg",

                         press: () {},
                       ),
                       CategoryCard(
                         title: "Meditation",
                         svgSrc: "assets/icons/Meditation.svg",
                         press: () {
                           print("Clicked");
                         Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context) {
                               return Meditaion_detais();
                             }),
                           );
                         },
                       ),
                       CategoryCard(
                         title: "Yoga",
                         svgSrc: "assets/icons/yoga.svg",
                         press: () {},
                       ),



                    ],),
                  )

                ],
              )
            ),
          )

        ],
      ),
    );
  }
}



