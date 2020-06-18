import 'package:charmello/PlaceholderWidget.dart';
import 'package:charmello/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:charmello/BottomNavigationBarController.dart';
import 'BottomNavigationBarController.dart';

class CurrentlyPlaying extends StatefulWidget {
  Story data;
  final Function getData;
  PlayerWidget player;

  CurrentlyPlaying({Key key,this.getData}) : super(key: key);

  @override
  _CurrentlyPlaying createState() => _CurrentlyPlaying();

}

class _CurrentlyPlaying extends State<CurrentlyPlaying>{
  // ignore: non_constant_identifier_names
  Future<Center> FetchPlayer() async {
    Story data = widget.getData();
    if(data.name != null){
      FirebaseStorage storage = FirebaseStorage.instance;
      StorageReference ref = storage.ref().child(data.name + '/Audio.mp3');
      var url1 = await ref.getDownloadURL();
      PlayerWidget player = new PlayerWidget(url: url1);
      return Center(
        child: new Column(
          children: <Widget>[
            Image(
              image: data.storyImage.image,
            ),
            player
          ],
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Center>(
          future: FetchPlayer(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return snapshot.data;

            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}