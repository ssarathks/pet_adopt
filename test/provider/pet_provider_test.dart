import 'package:pet_adopt/models/pet/pet.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Provider', () {
    var petProvider = PetProvider();

    test('Some new pets should be added', () {
      Pet pet = Pet(
          id: 1,
          name: 'My Pet',
          species: 'My pet specied',
          breed: 'My pet breed',
          age: 4,
          price: 50,
          imageUrl: '',
          isAdopted: false,
          adoptedTime: '');
      Pet pet2 = Pet(
          id: 2,
          name: 'My Pet2',
          species: 'My pet specied2',
          breed: 'My pet breed2',
          age: 4,
          price: 50,
          imageUrl: '',
          isAdopted: false,
          adoptedTime: '');
      petProvider.addPets([pet, pet2]);
      expect(petProvider.pets.contains(pet), true);
    });

    test('A pet should be updated', () {
      Pet updatedPet = Pet(
          id: 1,
          name: 'My Pet updated',
          species: 'My pet specied updated',
          breed: 'My pet breed updated',
          age: 4,
          price: 50,
          imageUrl: '',
          isAdopted: false,
          adoptedTime: '');
      petProvider.updatePet(updatedPet);
      expect(petProvider.pets.contains(updatedPet), true);
    });
  });
}
