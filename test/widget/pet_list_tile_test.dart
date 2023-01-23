import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adopt/providers/pet/pet_provider.dart';
import 'package:pet_adopt/screens/pet_list_screen.dart';
import 'package:provider/provider.dart';

Widget createPetListScreen() {
  return ChangeNotifierProvider<PetProvider>(
    create: (context) => PetProvider(),
    child: MaterialApp(
      home: PetListScreen(),
    ),
  );
}

void main() {
  group('Pet list screen Widget Tests', () {
    testWidgets('Test presence of header', (tester) async {
      await tester.pumpWidget(createPetListScreen());
      expect(find.text('Pets'), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
