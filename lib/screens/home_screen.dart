import 'package:Charmello_v0/widgets/featured_carousel.dart';
import 'package:flutter/material.dart';
import 'package:Charmello_v0/widgets/immersion_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  // List<IconData> _icons = [

  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            // Padding(
            //   padding: EdgeInsets.only(left: 42.0, right: 236.0),
            //   child: Text(
            //     '5 Min Bites',
            //     style: TextStyle(
            //       fontSize: 24.0,
            //       fontWeight: FontWeight.w900,
            //       // letterSpacing: 0.5,
            //       color: Theme.of(context).primaryColor,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 2.0),
            ImmersionCarousel(),
            SizedBox(height: 10.0),
            FeaturedCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.search,
              Icons.play_circle_outline,
              size: 30,
            ),
            title: SizedBox.shrink(),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.play_circle_outline,
          //     size: 30,
          //   ),
          //   title: SizedBox.shrink(),
          // ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage:
                  AssetImage('assets/images/marshmallow_wrapped_up.png'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
