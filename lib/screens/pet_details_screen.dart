import 'package:flutter/material.dart';
import 'package:pet_adopt/constants/hero_tag_constants.dart';
import 'package:pet_adopt/constants/theme_constants.dart';
import 'package:pet_adopt/models/pet/pet.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:provider/provider.dart';

class PetDetailsScreen extends StatefulWidget {
  // final Pet pet;
  static const routeName = '/pet-details';

  const PetDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int petId = args['petId'];
    Pet pet = Provider.of<PetProvider>(context).findPetById(petId);
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => openImageViewerHandler(context, pet),
                child: Hero(
                  tag: '${HeroTags.PET_DETAIL_IMAGE}${pet.id}',
                  child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            pet.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          const DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      stops: [0.06, 0.6],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color.fromARGB(240, 15, 15, 15),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ]))),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: 30, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: ThemeConstants.scaffoldHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${pet.age} years old',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Breed: ${pet.breed}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    buildPetPriceContainer(pet, context)
                  ],
                ),
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeConstants.scaffoldHorizontalPadding),
            child: ElevatedButton(
              onPressed: pet.isAdopted
                  ? null
                  : () {
                      Provider.of<PetProvider>(context, listen: false)
                          .adoptPet(pet);
                    },
              child: Container(
                  width: double.infinity,
                  child: Center(child: Text("Adopt me"))),
            ),
          )
        ],
      ),
    );
  }

  openImageViewerHandler(BuildContext context, Pet pet) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: InteractiveViewer(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                pet.imageUrl,
                fit: BoxFit.cover,
              ),
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"))
            ],
          );
        });
  }

  Widget buildPetPriceContainer(Pet pet, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade900),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            '\$${pet.price}',
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15),
          ),
        ));
  }
}
