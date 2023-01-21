import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_adopt/models/pet/pet.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:pet_adopt/screens/pet_details_screen.dart';
import 'package:pet_adopt/widgets/pet_list_tile.dart';
import 'package:provider/provider.dart';

class PetListScreen extends StatefulWidget {
  static const routeName = '/pet-list';

  const PetListScreen({Key? key}) : super(key: key);

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  //CONTROLLERS
  final ScrollController _petListScrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<PetProvider>(context, listen: false).searchPets();
      // Provider.of<PetProvider>(context, listen: false).searchAdoptedPets();
      _petListScrollController.addListener(() {
        if (_petListScrollController.offset >=
                _petListScrollController.position.maxScrollExtent &&
            !_petListScrollController.position.outOfRange) {
          Provider.of<PetProvider>(context, listen: false).searchPets();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _petListScrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets"),
      ),
      body: Consumer<PetProvider>(
        builder: (ctx, petModal, _) => ListView.builder(
          controller: _petListScrollController,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () => redirectToDetailsScreen(context, petModal.pets[index]),
            child: PetListTile(
              key: ValueKey(petModal.pets[index].id),
              pet: petModal.pets[index],
            ),
          ),
          itemCount: petModal.pets.length,
        ),
      ),
    );
  }

  redirectToDetailsScreen(BuildContext context, Pet pet) {
    Navigator.of(context)
        .pushNamed(PetDetailsScreen.routeName, arguments: {'petId': pet.id});
  }
}
