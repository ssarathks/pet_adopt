import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_adopt/constants/theme_constants.dart';
import 'package:pet_adopt/models/pet/pet.dart';
import 'package:pet_adopt/models/pet/pet_filter.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:pet_adopt/screens/adopted_pets_screen.dart';
import 'package:pet_adopt/screens/pet_details_screen.dart';
import 'package:pet_adopt/widgets/pet_list_tile.dart';
import 'package:pet_adopt/widgets/search_bar.dart';
import 'package:provider/provider.dart';

enum PopupOptions { AdoptedPets }

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
    return GestureDetector(
      onTap: () {
        unFocusKeyBoard();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pets"),
          actions: [
            PopupMenuButton(
                onSelected: (value) => _popupSelectHandler(value),
                itemBuilder: (ctx) => [
                      const PopupMenuItem(
                        child: Text("Adopted Pets"),
                        value: PopupOptions.AdoptedPets,
                      )
                    ])
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeConstants.scaffoldHorizontalPadding),
                child: SearchBar(
                  onSearched: searchPetsWithFilterHandler,
                ),
              ),
            ),
            Expanded(
              child: Consumer<PetProvider>(
                builder: (ctx, petModal, _) => petModal.pets.isEmpty
                    ? const Center(
                        child: Text("No pets found"),
                      )
                    : ListView.builder(
                        controller: _petListScrollController,
                        itemBuilder: (ctx, index) => InkWell(
                          onTap: () => redirectToDetailsScreen(
                              context, petModal.pets[index]),
                          child: PetListTile(
                            key: ValueKey(petModal.pets[index].id),
                            pet: petModal.pets[index],
                          ),
                        ),
                        itemCount: petModal.pets.length,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  redirectToDetailsScreen(BuildContext context, Pet pet) {
    Navigator.of(context)
        .pushNamed(PetDetailsScreen.routeName, arguments: {'petId': pet.id});
  }

  searchPetsWithFilterHandler(String petName) {
    unFocusKeyBoard();
    if (petName.isEmpty) {
      Provider.of<PetProvider>(context, listen: false).searchPets();
    }
    PetFilter filter = PetFilter(name: petName);
    Provider.of<PetProvider>(context, listen: false)
        .searchPetsWithFilter(filter);
  }

  _popupSelectHandler(value) {
    switch (value) {
      case PopupOptions.AdoptedPets:
        Navigator.of(context).pushNamed(AdoptedPetsScreen.routeName);
        break;
      default:
    }
  }

  unFocusKeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
