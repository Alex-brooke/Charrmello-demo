import 'dart:math';
import 'package:charmello/BottomNavigationBarController.dart';
import 'package:charmello/CurrentlyPlaying.dart';
import 'package:charmello/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlaceholderWidget extends StatefulWidget {

  FirebaseStorage storage = FirebaseStorage.instance;
  final firestoreInstance = Firestore.instance;
  final Story data;
  final Function changeToPlay;
  final Function getData;
  final Function setData;

  PlaceholderWidget({Key key, this.data, this.changeToPlay, this.getData, this.setData}) : super(key: key);
  @override
  PlaceholderWidgetState createState() => PlaceholderWidgetState();

}
class PlaceholderWidgetState extends State<PlaceholderWidget> {

  Future<CarouselSlider> FetchImage() async {
    var docs = await widget.firestoreInstance.collection('Stories').getDocuments();
    List<Story> list = new List();
    for(var element in docs.documents){
      var imageLocation = element.data['name'] + '/image.png';
      StorageReference ref = widget.storage.ref().child(imageLocation);
      var url =  await ref.getDownloadURL();
      list.add(Story(element.data['name'],url,Image.network(url, fit: BoxFit.fill)));
    }

    return CarouselSlider(options: CarouselOptions(),
      items: list.map((item)  {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: GestureDetector(
                    child: item.storyImage,
                    onTap: () {
                      Story new_story = Story(item.name, item.imageURL, item.storyImage);
                      widget.setData(new_story);
                      widget.changeToPlay();
                    }));
          },
        );
      }).toList(),
    );

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: FutureBuilder<CarouselSlider>(
          future: FetchImage(),
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