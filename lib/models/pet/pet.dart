class Pet {
  int id = 0;
  String name = '';
  String species = '';
  String breed = '';
  int age = 0;
  double price = 0;
  String imageUrl = '';
  bool isAdopted = false;
  String adoptedTime = '';

  Pet(
      {required this.id,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.price,
      required this.imageUrl,
      required this.isAdopted,
      required this.adoptedTime});

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    species = json['species'];
    breed = json['breed'];
    age = json['age'];
    price = json['price'];
    imageUrl = json['image_url'];
    isAdopted = json['is_adopted'] == 0 ? false : true;
    adoptedTime = json['adopted_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['species'] = this.species;
    data['breed'] = this.breed;
    data['age'] = this.age;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['is_adopted'] = this.isAdopted ? 1 : 0;
    data['adopted_time'] = this.adoptedTime;
    return data;
  }
}
