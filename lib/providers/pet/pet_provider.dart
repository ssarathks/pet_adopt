import 'package:flutter/cupertino.dart';
import 'package:pet_adopt/constants/pet/database_constant.dart';
import 'package:pet_adopt/constants/pet/pet_constants.dart';
import 'package:pet_adopt/models/pet/pet.dart';
import 'package:sqflite/sqflite.dart';

class PetProvider extends ChangeNotifier {
  List<Pet> _pets = [];
  List<int> _adoptedPetIds = [];

  List<Pet> get pets => [..._pets];
  List<int> get adoptedPetIds => [..._adoptedPetIds];

  void searchPets() async {
    // FETCHING 10 ITEMS FROM PetConstants list of pets
    // var fetchedPets = PetConstants.pets.skip(_pets.length).take(10).toList();

    Database db = await PetsDatabase().database;
    List<Map<String, dynamic>> fetchedPets =
        await db.query('pet') as List<Map<String, dynamic>>;
    print('fetched pets is $fetchedPets');
    // CONVERTING TO LIST OF DART OBJECT
    List<Pet> pets = fetchedPets.map<Pet>((pet) => Pet.fromJson(pet)).toList();
    addPets(pets);
  }

  Future<int> adoptPet(Pet pet) async {
    Database db = await PetsDatabase().database;
    pet.isAdopted = true;
    pet.adoptedTime = DateTime.now().toIso8601String();
    int rows = await db.update('pet', pet.toJson(),
        where: 'id = ?',
        whereArgs: [pet.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    updatePet(pet);
    return rows;
  }

  void updatePet(Pet pet) {
    int index = _pets.indexWhere((p) => p.id == pet.id);
    _pets[index] = pet;
    notifyListeners();
  }

  Pet findPetById(int petId) {
    Pet pet = _pets.firstWhere((pet) => pet.id == petId);
    return pet;
  }

  void addPets(List<Pet> pets) {
    _pets = [..._pets, ...pets];
    notifyListeners();
  }
}
