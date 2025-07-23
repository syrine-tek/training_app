import 'package:flutter/material.dart';
import '/models/exercise.dart';
import '../exercise_detail.dart';

class LeftHandExercisesPage extends StatelessWidget {
  const LeftHandExercisesPage({super.key});

  static const List<Exercise> exercises = [
    Exercise(
      id: '3',
      name: 'Flexion des doigts gauches',
      description: 'Renforcement spécifique gauche',
      equipmentId: '2',
      instructions: '''
1. Main gauche ouverte
2. Fermez progressivement le poing
3. Serrez fort pendant 3 secondes
4. Répétez 12 fois''',
      imagePath: 'assets/flexionDoit.jpg',
      detailImagePath:'assets/flexionDoit.png',

    ),
    Exercise(
      id: '4',
      name: 'Adduction pouce gauche',
      description: 'Travail de la pince',
      equipmentId: '2',
      instructions: '''
1. Placez un élastique autour du pouce
2. Écartez le pouce contre résistance
3. Maintenez 5 secondes
4. 10 répétitions''',
      imagePath: 'assets/EtirementPoignet.jpeg',
      detailImagePath:'assets/rotationPoignets.png' ,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercices Main Gauche')),
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
                    builder: (context) =>
                        ExerciseDetailPage(exercise: exercise),
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
