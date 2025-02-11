class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name, this.image, this.rate, this.location);
}

List<Destination> destinations = [
  Destination("Costa Rica Quest", "assets/images/backdrop01.png", "5.0",
      "Central America"),
  Destination("Wildlife Odyssey", "assets/images/backdrop02.png", "4.8",
      "the Galapagos Islands"),
  Destination(
      "La Selva Lodge", "assets/images/backdrop03.png", "5.0", "Amazon"),
  Destination("Beaches & Rainforest", "assets/images/backdrop04.png", "4.0",
      "Pacuare River"),
  Destination("Incas and Rainforest", "assets/images/backdrop05.png", "3.4",
      "Indonesia"),
  Destination("Western Madagascar: River and Trekking Adventure",
      "assets/images/backdrop06.png", "5.0", "Makay Massif"),
];
