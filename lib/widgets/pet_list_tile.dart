import 'package:flutter/material.dart';
import 'package:pet_adopt/constants/hero_tag_constants.dart';
import 'package:pet_adopt/constants/theme_constants.dart';
import 'package:pet_adopt/models/pet/pet.dart';

class PetListTile extends StatelessWidget {
  final Pet pet;
  const PetListTile({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ThemeConstants.scaffoldHorizontalPadding),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ThemeConstants.cardBorderRadius)),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: '${HeroTags.PET_DETAIL_IMAGE}${pet.id}',
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                ThemeConstants.cardBorderRadius),
                            bottomLeft: Radius.circular(
                                ThemeConstants.cardBorderRadius)),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(pet.imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(children: [
                        Text(
                          pet.name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          pet.breed,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          pet.isAdopted ? 'Already Adopted' : '',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}