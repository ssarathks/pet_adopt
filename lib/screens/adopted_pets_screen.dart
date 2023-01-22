import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_adopt/models/pet/pet.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:pet_adopt/widgets/pet_list_tile.dart';
import 'package:provider/provider.dart';

class AdoptedPetsScreen extends StatefulWidget {
  static const routeName = '/adopted-pets';
  const AdoptedPetsScreen({Key? key}) : super(key: key);

  @override
  State<AdoptedPetsScreen> createState() => _AdoptedPetsScreenState();
}

class _AdoptedPetsScreenState extends State<AdoptedPetsScreen> {
  List<Pet> _adoptedPets = [];
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<PetProvider>(context, listen: false)
          .searchAdoptedPets()
          .then((pets) {
        setState(() {
          _adoptedPets = [...pets];
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_adoptedPets);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopted Pets'),
      ),
      body: _adoptedPets.isNotEmpty
          ? ListView.builder(
              itemCount: _adoptedPets.length,
              itemBuilder: ((ctx, index) => PetListTile(
                    pet: _adoptedPets[index],
                    showAdoptedTime: true,
                  )))
          : Center(child: Text("No pets adopted yet!")),
    );
  }
}
