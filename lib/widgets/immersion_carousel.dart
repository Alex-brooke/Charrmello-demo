import 'package:Charmello_v0/models/immersion_model.dart';
// import 'package:Charmello_v0/screens/player_screen.dart';
import 'package:flutter/material.dart';

class ImmersionCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 560.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: immersions.length,
            itemBuilder: (BuildContext context, int index) {
              Immersion immersion = immersions[index];
              return GestureDetector(
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => PlayerScreen(immersion: immersion),
                //   ),
                // ),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  width: 380.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        height: 540.0,
                        width: 360.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image(
                                height: 540.0,
                                width: 360.0,
                                image: AssetImage(immersion.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 19.0,
                              bottom: 21.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    immersion.author,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Text(
                                    immersion.title,
                                    style: TextStyle(
                                      color: Color(0xFFF2F2CB),
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
