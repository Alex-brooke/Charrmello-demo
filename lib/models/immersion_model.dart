
import 'package:Charmello_v0/models/featured_model.dart';

class Immersion {
  String imageUrl;
  String author;
  String title;
  

  Immersion ({
    this.imageUrl,
    this.author, 
    this.title,
  });
}

List<Featured> features = [
  Featured(
    imageUrl: 'assets/images/bearded_men.png',
    title: 'Bearded Duo',
    author: 'Alex Brooke',
  ),
  Featured(
    imageUrl: 'assets/images/boy_and_bear.jpg',
    title: 'The Boy & The Bear',
    author: 'Ethan Brazell',
  ),
  Featured(
    imageUrl: 'assets/images/man_and_tattoos.jpg',
    title: 'Hopefull',
    author: 'Joshua Lomax',
  ),
  Featured(
    imageUrl: 'assets/images/woman_umpire.jpg',
    title: 'The Umpire',
    author: 'Lewis Pearson',
  ),
  Featured(
    imageUrl: 'assets/images/world_inside_head.png',
    title: 'Brain Freeze',
    author: 'Joshua Lomax',
  ),
  Featured(
    imageUrl: 'assets/images/russiandoll_man.png',
    title: 'My Inner Brian',
    author: 'Joshua Lomax',
  ),
  Featured(
    imageUrl: 'assets/images/area_51.jpg',
    title: '8th Zone',
    author: 'Alex Brooke',
  ),
  Featured(
    imageUrl: 'assets/images/girl_and_frog_adventure_closeup.jpg',
    title: 'Froggy Adventure',
    author: 'Lydia Brooke',
  ),
];

List<Immersion> immersions = [
  Immersion(
    imageUrl: 'assets/images/future_sailor.jpg',
    author: 'By Alex Brooke',
    title: 'Future Sailor',
  ),
  Immersion(
    imageUrl: 'assets/images/man_crossing_city_street.jpg',
    author: 'By Joshua Lomax',
    title: 'City Escape. In A City',
  ),
  Immersion(
    imageUrl: 'assets/images/dino_with_robot.png',
    author: 'By Harry Pickup',
    title: 'My Dino Robot',
  ),
  Immersion(
    imageUrl: 'assets/images/glowing_body.jpg',
    author: 'By Alex Brooke',
    title: 'Life As A Blood Cell',
  ),
  Immersion(
    imageUrl: 'assets/images/crater_city.jpg',
    author: 'By Joshua Lomax',
    title: 'Contained',
  ),
];