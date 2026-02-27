import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'MainMenuPage.dart';
import 'PuzzlePage.dart';

class Levelpage extends StatefulWidget {
  @override
  State<Levelpage> createState() => _LevelpageState();
}

class _LevelpageState extends State<Levelpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/LEVAL PAGE/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  height: 70,
                  margin: EdgeInsets.only(left: 5),
                  // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('Images/LEVAL PAGE/yellow.png'))),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainMenu();
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back, size: 50),
                    style: IconButton.styleFrom(foregroundColor: Colors.white),
                  ),
                ),
                SizedBox(width: 30),
                Image(
                  image: AssetImage('Images/LEVAL PAGE/Select puzzle name.png'),
                ),
              ],
            ),

            Expanded(
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: MainMenu.statuslist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio: 1, //Wight=1, Height=2;
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    print('----->${MainMenu.statuslist.length}'); // Level chack karva mate :-

                    print("+=====${index}"); //Index ma value kay male te chack karva.

                    print("Lpage---->Statuslist${MainMenu.statuslist}"); //Level page ma statuslist ma su male chhe te chake karva.

                    String individuallevelstatus = MainMenu.statuslist[index];

                    print("---->${individuallevelstatus}");

                    int currentlevel =
                        MainMenu.shareprefrence!.getInt(MainMenu.levelkey) ?? 0;

                    if (individuallevelstatus == MainMenu.clear) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 900),
                              reverseDuration: Duration(milliseconds: 900),
                              child: PuzzlePage(index),
                            ),
                          );
                        },
                        /*child: Container(
                          // color: Colors.white,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'Images/LEVAL PAGE/button 2.png',
                              ),
                            ),
                          ),
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),*/
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage(
                                'Images/LEVAL PAGE/button 2.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Image(
                                height: 50,
                                image: AssetImage(
                                  'Images/LEVAL PAGE/right.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (individuallevelstatus == MainMenu.skip) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 900),
                              reverseDuration: Duration(milliseconds: 900),
                              child: PuzzlePage(index),
                            ),
                          );
                        },
                        /*child: Container(
                          // color: Colors.white,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'Images/LEVAL PAGE/button 2.png',
                              ),
                            ),
                          ),
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),*/
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'Images/LEVAL PAGE/button 2.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      if (currentlevel == index) { // <------ this condition use :---> CurrentLevel Complete After Next leve auto open.
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(milliseconds: 900),
                                reverseDuration: Duration(milliseconds: 900),
                                child: PuzzlePage(index),
                              ),
                            );
                          },
                          /*child: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),*/
                          child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              image: DecorationImage(
                                image: AssetImage(
                                  'Images/LEVAL PAGE/button 2.png',
                                ),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return InkWell(
                        onTap: () {},
                        /*child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text("L", style: TextStyle(fontSize: 40)),
                        ),*/
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage(
                                'Images/LEVAL PAGE/button 2.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                height: 50,
                                image: AssetImage('Images/LEVAL PAGE/lock.png'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

