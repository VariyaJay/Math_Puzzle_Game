import 'package:flutter/material.dart';

import 'MainMenuPage.dart';
import 'PuzzlePage.dart';

class WiningPage extends StatefulWidget {
  int completelevel;
  WiningPage(this.completelevel);
  @override
  State<WiningPage> createState() => _WiningPageState();
}

class _WiningPageState extends State<WiningPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/winning page/background image.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                '${widget.completelevel}',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              SizedBox(height: 15),
              Image(
                image: AssetImage('Images/winning page/Group 1064.png'),
                width: 400,
                height: 50,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 15),
              Image(image: AssetImage('Images/winning page/logo.png')),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PuzzlePage(widget.completelevel);
                      },
                    ),
                  );
                },
                child: Image(
                  image: AssetImage('Images/winning page/continue.png'),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainMenu();
                      },
                    ),
                  );
                },
                child: Image(
                  image: AssetImage('Images/winning page/main menu.png'),
                ),
              ),
              SizedBox(height: 15),
              Image(image: AssetImage('Images/winning page/Buy pro.png')),
              SizedBox(height: 25),
              Image(image: AssetImage('Images/winning page/share button.png')),
            ],
          ),
        ),
      ),
    );
  }
}

/*onTap: () {
  int? nextLevelToPlay;
  int currentLevel = widget.level; // The level just completed
  bool foundNext = false;

  // Step 1: Start checking from the next level after current
  for (int i = currentLevel; i < MainMenu.statusList.length; i++) {
    String status = MainMenu.statusList[i];

    if (status == MainMenu.skip) {
      // Found next skipped level
      nextLevelToPlay = i + 1;
      foundNext = true;
      print("Next skipped level found: $nextLevelToPlay");
      break;
    } else if (status == MainMenu.pending) {
      // Found next locked level after all skips completed
      if (!foundNext) {
        nextLevelToPlay = i + 1;
        print("No skipped level left. Opening next locked level: $nextLevelToPlay");
        foundNext = true;
        break;
      }
    }
  }
  // Step 2: Navigate to that next level
  if (nextLevelToPlay != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Puzzlepage(nextLevelToPlay!),
      ),
    );
  }
  else {
    // Edge case: All levels are completed
    print("All levels are completed.");
    // You can optionally navigate to a "Congratulations" page or restart
  }
}*/