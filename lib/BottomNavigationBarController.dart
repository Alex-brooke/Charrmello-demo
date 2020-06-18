import 'package:charmello/CurrentlyPlaying.dart';
import 'package:flutter/material.dart';

import 'PlaceholderWidget.dart';

class Story {
  final String name;
  final String imageURL;
  final Image storyImage;

  Story(this.name, this.imageURL, this.storyImage);

}

class BottomNavigationBarController extends StatefulWidget {
  static final _myKey = new GlobalKey();
  @override
  _BottomNavigationBarController createState() => _BottomNavigationBarController();
}
class _BottomNavigationBarController extends State<BottomNavigationBarController> {

  Story data;
  int pageIndex = 0;

  @override
  void initState() {
    data = Story(null, null, Image.network(''));
    super.initState();
  }

  void changeToPlay() {
    setState(() {
      pageIndex = 1;
    });
  }

  Story getData() {
    return data;
  }

  Story setData(Story new_data) {
    data = new_data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
              title: new Text('Library'),
              icon: new Icon(Icons.library_books)
          ),
          BottomNavigationBarItem(
              title: new Text('Playing'),
              icon: new Icon(Icons.play_circle_filled)
          ),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          PlaceholderWidget(data:data, changeToPlay: changeToPlay, getData: getData, setData: setData),
          CurrentlyPlaying(getData: getData),
        ],
        index: pageIndex,
      ),
    );
  }
}