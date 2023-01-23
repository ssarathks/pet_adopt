import 'package:flutter/material.dart';
import 'package:pet_adopt/constants/color_constants.dart';
import 'package:pet_adopt/constants/theme_constants.dart';

class SearchBar extends StatelessWidget {
  final Function onSearched;
  SearchBar({Key? key, required this.onSearched}) : super(key: key);

  TextEditingController _nameFilterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.getMutedScaffoldColor(context),
      elevation: 0,
      shape: RoundedRectangleBorder(
          // side: BorderSide(
          //   width: 0.2
          // ),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: _nameFilterController,
                decoration: const InputDecoration(
                  hintText: 'Search with name',
                  border: InputBorder.none,
                ),
              )),
              IconButton(
                  onPressed: () => onSearched(_nameFilterController.text),
                  icon: const Icon(Icons.search))
            ],
          ),
        ]),
      ),
    );
  }
}
