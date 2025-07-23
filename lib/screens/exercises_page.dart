import 'package:flutter/material.dart';
import 'exercise_detail.dart';
import '../models/exercise.dart';

class ExercisesPage extends StatelessWidget {
  final String equipmentId;

  const ExercisesPage({
    super.key,
    required this.equipmentId,
  });

  static const List<Exercise> allExercises = [
    // =============== MAIN DROITE (9 exercices) ===============
    Exercise(
      id: '1',
      name: 'Flexion des doigts',
      description: 'Renforce la flexibilité des doigts droits',
      equipmentId: '1',
      instructions: '''
1. Placez votre main droite à plat sur une table
2. Fléchissez chaque doigt un à un en commençant par l'auriculaire
3. Maintenez 5 secondes
4. 10 répétitions par doigt''',
      imagePath: 'assets/flexionDoit.jpg',
      detailImagePath: 'assets/flexionDoit.jpg',
    ),
    Exercise(
      id: '2',
      name: 'Rotation du poignet',
      description: 'Améliore la mobilité du poignet',
      equipmentId: '1',
      instructions: '''
1. Bras droit plié à 90°
2. Tournez la paume vers le ciel puis le sol
3. Mouvement lent et contrôlé
4. 3 séries de 15 rotations''',
      imagePath: 'assets/rotation.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '3',
      name: 'Pince pouce-index',
      description: 'Développe la précision',
      equipmentId: '1',
      instructions: '''
1. Touchez le pouce avec chaque doigt successivement
2. Maintenez 2 secondes à chaque contact
3. Augmentez progressivement la vitesse
4. 5 séries de 10 mouvements''',
      imagePath: 'assets/pince_pouce_index.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '4',
      name: 'Levée de poids',
      description: 'Renforcement musculaire',
      equipmentId: '1',
      instructions: '''
1. Tenez un poids de 0.5kg
2. Flexion/extension du poignet
3. Gardez l'avant-bras stable
4. 4 séries de 8 répétitions''',
      imagePath: 'assets/levéePoids.jpg',
      detailImagePath: 'assets/leveePoids.jpg',
    ),
    Exercise(
      id: '5',
      name: 'Étirement global',
      description: 'Assouplissement articulaire',
      equipmentId: '1',
      instructions: '''
1. Étendez tous les doigts vers l'arrière
2. Maintenez 10 secondes
3. Répétez avec poignet fléchi
4. 5 répétitions par position''',
      imagePath: 'assets/EtirementPoignet.jpeg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '6',
      name: 'Manipulation de pièces',
      description: 'Améliore la dextérité',
      equipmentId: '1',
      instructions: '''
1. Disposez 10 pièces sur une table
2. Retournez-les une à une
3. Chronométrez votre temps
4. Essayez de battre votre record''',
      imagePath: 'assets/manipulation_pieces.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '7',
      name: 'Exercice de résistance',
      description: 'Force de préhension',
      equipmentId: '1',
      instructions: '''
1. Serrez une balle molle
2. Maintenez 7 secondes
3. Relâchez progressivement
4. 8 répétitions avec 30s repos''',
      imagePath: 'assets/resistance_droit.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '8',
      name: 'Tapping des doigts',
      description: 'Coordination digitale',
      equipmentId: '1',
      instructions: '''
1. Tapez successivement sur la table avec chaque doigt
2. Commencez lentement puis accélérez
3. Alternez les séquences
4. 3 minutes sans pause''',
      imagePath: 'assets/tapping_droit.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '9',
      name: 'Écriture simulée ',
      description: 'Contrôle moteur fin',
      equipmentId: '1',
      instructions: '''
1. Tenez un stylo adapté
2. Tracez des lettres dans l'air
3. Concentrez-vous sur la fluidité
4. 5 minutes d'exercice continu''',
      imagePath: 'assets/ecriture_droit.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),


  ];

  List<Exercise> get filteredExercises =>
      allExercises.where((ex) => ex.equipmentId == equipmentId).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercices ${equipmentId == '1' ? 'Droit' : 'Gauche'}'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: filteredExercises.length,
        itemBuilder: (ctx, index) {
          final ex = filteredExercises[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ExerciseDetailPage(exercise: ex),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      ex.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                      const Icon(Icons.fitness_center, size: 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ex.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}