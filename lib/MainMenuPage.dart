import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LevelPage.dart';
import 'PuzzlePage.dart';

class MainMenu extends StatefulWidget {
  static SharedPreferences? shareprefrence;
  static String levelkey = "Mycurrentlevel";
  static List<String>  statuslist =  [];

  static String lock = "Lock";
  static String clear = "Clear";
  static String skip = "Skip";

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    getshareprefrence();
  }

  int? CurrentLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   CurrentLevel!=null?Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/HOME PAGE/background image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top spacing (if needed)
            SizedBox(height: 180),

            // Center Column with buttons (as IconButtons now)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // PLAY Button
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 900),
                        reverseDuration: Duration(milliseconds: 900),
                        child: PuzzlePage(CurrentLevel!),
                      ),
                    );
                  },
                  icon: Image.asset('Images/HOME PAGE/continue botton.png'),
                  iconSize: 100, // adjust size if needed
                ),
                SizedBox(height: 20),

                // LEVEL Button
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 900),
                        reverseDuration: Duration(milliseconds: 900),
                        child: Levelpage(),
                      ),
                    );
                  },
                  icon: Image.asset('Images/HOME PAGE/Level Botton.png'),
                  iconSize: 100,
                ),
                SizedBox(height: 20),

                // BUY PRO Button
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('Images/HOME PAGE/Buy pro button.png'),
                  iconSize: 100,
                ),
              ],
            ),

            // Bottom Icon Row
            Padding(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('Images/HOME PAGE/share icon.png'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'Images/HOME PAGE/Privacy Policy Botton.png',
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('Images/HOME PAGE/mail icon.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> getshareprefrence() async {

    MainMenu.statuslist = List.filled(75, MainMenu.lock);


    print("Fpage_statusList--->${MainMenu.statuslist}");
    MainMenu.shareprefrence = await SharedPreferences.getInstance();

    MainMenu.statuslist = MainMenu.shareprefrence!.getStringList("StatusList")??MainMenu.statuslist;

    CurrentLevel = MainMenu.shareprefrence!.getInt(MainMenu.levelkey) ??0;
    setState(() {});


    print("After Shareprefrence_statusList--->${MainMenu.statuslist}");


    print("Fpage_Currentlevel--->${CurrentLevel}");

  }
}
