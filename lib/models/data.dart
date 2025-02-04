class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name,this.image,this.rate,this.location);
}

List<Destination> destinations = [
  Destination("SnowMT","assets/images/backdrop02.png","5.0","Greenland"),
  Destination("RockLake1","assets/images/backdrop03.png","5.0","America"),
  Destination("RockLake2","assets/images/backdrop04.png","5.0","America"),
  Destination("River","assets/images/backdrop05.png","4.0","England"),
  Destination("LavaLake","assets/images/backdrop06.png","3.0","Indonesia"),
  Destination("MTLake","assets/images/backdrop07.png","5.0","Thailand"),
];