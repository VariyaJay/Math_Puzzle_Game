import 'package:flutter/material.dart';
import 'package:sir_puzzle/WiningPage.dart';

import 'MainMenuPage.dart';

class PuzzlePage extends StatefulWidget {
  // String name  =  "sdfjg";

  int currentLevel;

  PuzzlePage(this.currentLevel);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  String Display = '';

  List answerlist = ["10", "25", "12", "14", "128"];

  @override
  Widget build(BuildContext context) {
    // widget.
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/board main page/background image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            //Top Bar
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 0,
                left: 0,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TopBar Left Side Skip Button
                  IconButton(
                    onPressed: () {
                      MainMenu.statuslist[widget.currentLevel] = MainMenu.skip;
                      MainMenu.shareprefrence!.setStringList(
                        "StatusList",
                        MainMenu.statuslist,
                      );

                      print("Spage---->StatusList${MainMenu.statuslist}");

                      widget.currentLevel++;
                      MainMenu.shareprefrence!.setInt(
                        MainMenu.levelkey,
                        widget.currentLevel,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PuzzlePage(widget.currentLevel);
                          },
                        ),
                      );

                      print("Spage_Currentlevel--->${widget.currentLevel}");

                      setState(() {});
                    },
                    icon: Image.asset('Images/board main page/icon 1 (2).png'),
                    iconSize: 40,
                  ),
                  //TopBar Center level Show
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "Images/board main page/g button-1.png",
                          ),
                        ),
                      ),
                      child: Text(
                        "Level ${widget.currentLevel + 1}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  //TopBar Right Side Hint Button
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Hint for Level 1',
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            content: Text("", style: TextStyle(fontSize: 20)),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Image.asset('Images/board main page/icon 1 (1).png'),
                    iconSize: 40,
                  ),
                  /* IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'Images/board main page/icon 1 (1).png',
                      ),
                      iconSize: 40,
                    ),*/
                ],
              ),
            ),
            //Center Level Board Image
            Container(
              height: 400,
              width: 400,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "Images/board main page/board image/leval-${widget.currentLevel + 1}.png",
                  ),
                ),
              ),
            ),

            //Show User Enter Number & Remove Number Icon
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'Images/board main page/g button-1.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Text(
                      Display,
                      style: TextStyle(fontSize: 40),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Display = '';
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 30),
                    height: 60,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'Images/board main page/g button.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //0 To 9 Number Box
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Display = Display + '$index';
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'Images/board main page/yellow.png',
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text('$index', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            //Submit Button
            InkWell(
              onTap: () {
                if (Display == answerlist[widget.currentLevel]) {
                  MainMenu.statuslist[widget.currentLevel] = MainMenu.clear;
                  MainMenu.shareprefrence!.setStringList(
                    "StatusList",
                    MainMenu.statuslist,
                  );

                  print("Spage---->StatusList${MainMenu.statuslist}");
                  print("Spage---->StatusList${MainMenu.statuslist}");
                  widget.currentLevel++;
                  MainMenu.shareprefrence!.setInt(
                    MainMenu.levelkey,
                    widget.currentLevel,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WiningPage(widget.currentLevel);
                      },
                    ),
                  );
                  print("Spage---->Currents${widget.currentLevel}");
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Wrong")));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                  left: 40,
                  right: 40,
                  top: 0,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'Images/board main page/g button-1.png',
                      // your background image
                      fit: BoxFit.fill,
                    ),
                    Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // String getHintForLevel(int level) {
  //   if (level <= MainMenu.levelHints.length) {
  //     return MainMenu.levelHints[level - 1];
  //   } else {
  //     return "No hint available for this level.";
  //   }
  // }
}

//User This page in forwordbak clik in mobile to not close app :--
/*PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
         if(!didPop){
           Navigator.push(context, MaterialPageRoute(builder: (context) {
             return MainMenu();
           },));
         }
         print('-------$didPop');
      },);*/
