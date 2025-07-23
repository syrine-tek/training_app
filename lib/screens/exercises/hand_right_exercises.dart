import 'package:flutter/material.dart';
import '/models/exercise.dart';
import '../exercise_detail.dart';

class RightHandExercisesPage extends StatelessWidget {
  const RightHandExercisesPage({super.key});

  static const List<Exercise> exercises = [
    Exercise(
      id: '1',
      name: 'Flexion des doigts droits',
      description: 'Renforcement des fléchisseurs',
      equipmentId: '1',
      instructions: '''
1. Placez votre main droite à plat sur une table.
2. Soulevez chaque doigt un à un.
3. Maintenez 5 secondes.
4. Répétez 10 fois par doigt.
''',
      imagePath: 'assets/flexionDroit.jpg',
        detailImagePath:'assets/flexionDoit.png'
    ),
    Exercise(
      id: '2',
      name: 'Extension poignet droit',
      description: 'Amélioration de la mobilité',
      equipmentId: '1',
      instructions: '''
1. Bras droit tendu devant vous.
2. Main vers le bas.
3. Remontez la main avec résistance.
4. 3 séries de 15 répétitions.
''',
      imagePath: 'assets/EtirementPoignet.jpeg',
        detailImagePath:'assets/rotationPoignets.png'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercices Main Droite'),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(
                exercise.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.error),
              ),
              title: Text(exercise.name),
              subtitle: Text(exercise.description),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailPage(exercise: exercise),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
