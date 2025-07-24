import 'dart:js';

import 'package:flutter/material.dart';
import 'exercise_detail.dart';
import '../models/exercise.dart';

class ExercisesPage extends StatelessWidget {
  final String equipmentId;
  final String equipmentName;

  const ExercisesPage({
    super.key,
    required this.equipmentId,
    required this.equipmentName,
  });

  static const List<Exercise> allExercises = [
    // =============== MAINS (REF-001) - 9 exercices ===============
    Exercise(
      id: '1',
      name: 'Flexion des doigts',
      description: 'Renforce la flexibilité des doigts',
      equipmentId: '1',
      instructions: '''
1. Placez votre main à plat sur une table
2. Fléchissez chaque doigt un à un
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
1. Bras plié à 90°
2. Tournez la paume vers le ciel puis le sol
3. Mouvement lent et contrôlé
4. 3 séries de 15 rotations''',
      imagePath: 'assets/rotation.jpg',
      detailImagePath: 'assets/rotationPoignets.png',
    ),
    Exercise(
      id: '3',
      name: 'Pince pouce-index',
      description: 'Développe la précision digitale',
      equipmentId: '1',
      instructions: '''
1. Touchez le pouce avec chaque doigt successivement
2. Maintenez 2 secondes à chaque contact
3. 5 séries de 10 mouvements''',
      imagePath: 'assets/exercises/main_pince.jpg',
      detailImagePath: 'assets/exercises/main_pince_detail.jpg',
    ),
    Exercise(
      id: '4',
      name: 'Levée de poids légers',
      description: 'Renforcement musculaire',
      equipmentId: '1',
      instructions: '''
1. Tenez un poids de 0.5kg
2. Flexion/extension du poignet
3. 4 séries de 8 répétitions''',
      imagePath: 'assets/leveePoids.jpg.',
      detailImagePath: 'assets/levéePoids.jpg',
    ),
    Exercise(
      id: '5',
      name: 'Étirement global',
      description: 'Assouplissement articulaire',
      equipmentId: '1',
      instructions: '''
1. Étendez tous les doigts vers l'arrière
2. Maintenez 10 secondes
3. 5 répétitions par position''',
      imagePath: 'assets/EtirementPoignet.jpeg',
      detailImagePath: 'assets/EtirementPoignet.jpeg',
    ),
    Exercise(
      id: '6',
      name: 'Manipulation de pièces',
      description: 'Améliore la dextérité',
      equipmentId: '1',
      instructions: '''
1. Disposez 10 pièces sur une table
2. Retournez-les une à une
3. Chronométrez votre temps''',
      imagePath: 'assets/signification-de-la-longueur-de-votre-petit-doigt.jpg',
      detailImagePath: 'assets/esignification-de-la-longueur-de-votre-petit-doigt.jpg',
    ),
    Exercise(
      id: '7',
      name: 'Exercice de résistance',
      description: 'Force de préhension',
      equipmentId: '1',
      instructions: '''
1. Serrez une balle molle
2. Maintenez 7 secondes
3. 8 répétitions avec 30s repos''',
      imagePath: 'assets/pression-main-removebg-preview.png',
      detailImagePath: 'assets/pression-main-removebg-preview.png',
    ),
    Exercise(
      id: '8',
      name: 'Tapping des doigts',
      description: 'Coordination digitale',
      equipmentId: '1',
      instructions: '''
1. Tapez successivement sur la table
2. Commencez lentement puis accélérez
3. 3 minutes sans pause''',
      imagePath: 'assets/signification-de-la-longueur-de-votre-petit-doigt.jpg',
      detailImagePath: 'assets/signification-de-la-longueur-de-votre-petit-doigt.jpg',
    ),
    Exercise(
      id: '9',
      name: 'Écriture simulée',
      description: 'Contrôle moteur fin',
      equipmentId: '1',
      instructions: '''
1. Tenez un stylo adapté
2. Tracez des lettres dans l'air
3. 5 minutes d'exercice''',
      imagePath: 'assets/exercises/main_ecriture.jpg',
      detailImagePath: 'assets/exercises/main_ecriture_detail.jpg',
    ),

    // =============== PIEDS (REF-002) - 9 exercices ===============
    Exercise(
      id: '10',
      name: 'Flexion plantaire',
      description: 'Renforce la cheville et les orteils',
      equipmentId: '2',
      instructions: '''
1. Asseyez-vous jambes tendues
2. Pointez les orteils vers l'avant
3. 10 répétitions''',
      imagePath: 'assets/exercises/pied_flexion.jpg',
      detailImagePath: 'assets/exercises/pied_flexion_detail.jpg',
    ),
    Exercise(
      id: '11',
      name: 'Rotation de cheville',
      description: 'Améliore la mobilité articulaire',
      equipmentId: '2',
      instructions: '''
1. Pied levé légèrement du sol
2. Rotation horaire et anti-horaire
3. 3 séries de 10 rotations''',
      imagePath: 'assets/exercises/pied_rotation.jpg',
      detailImagePath: 'assets/exercises/pied_rotation_detail.jpg',
    ),
    Exercise(
      id: '12',
      name: 'Marche sur place',
      description: 'Renforcement général',
      equipmentId: '2',
      instructions: '''
1. Debout, tenir un support
2. Lever alternativement les talons
3. 3 séries de 15 répétitions''',
      imagePath: 'assets/exercises/pied_marche.jpg',
      detailImagePath: 'assets/exercises/pied_marche_detail.jpg',
    ),
    Exercise(
      id: '13',
      name: 'Étirement des orteils',
      description: 'Assouplit les articulations',
      equipmentId: '2',
      instructions: '''
1. Tirez doucement sur chaque orteil
2. Maintenez 10 secondes
3. Répétez 3 fois''',
      imagePath: 'assets/exercises/pied_etirement.jpg',
      detailImagePath: 'assets/exercises/pied_etirement_detail.jpg',
    ),
    Exercise(
      id: '14',
      name: 'Equilibre unipodal',
      description: 'Améliore la proprioception',
      equipmentId: '2',
      instructions: '''
1. Tenez-vous sur un pied
2. Maintenez 30 secondes
3. Changez de pied''',
      imagePath: 'assets/exercises/pied_equilibre.jpg',
      detailImagePath: 'assets/exercises/pied_equilibre_detail.jpg',
    ),
    Exercise(
      id: '15',
      name: 'Resistance élastique',
      description: 'Force musculaire',
      equipmentId: '2',
      instructions: '''
1. Fixez un élastique autour du pied
2. Résistance en flexion/extension
3. 3 séries de 12 répétitions''',
      imagePath: 'assets/exercises/pied_elastique.jpg',
      detailImagePath: 'assets/exercises/pied_elastique_detail.jpg',
    ),
    Exercise(
      id: '16',
      name: 'Mouvement circulaire',
      description: 'Coordination motrice',
      equipmentId: '2',
      instructions: '''
1. Tracez des cercles avec le pied
2. 10 rotations dans chaque sens
3. 3 séries''',
      imagePath: 'assets/exercises/pied_cercle.jpg',
      detailImagePath: 'assets/exercises/pied_cercle_detail.jpg',
    ),
    Exercise(
      id: '17',
      name: 'Soulèvement de talon',
      description: 'Renforce les mollets',
      equipmentId: '2',
      instructions: '''
1. Debout, levez les talons
2. Maintenez 5 secondes
3. 15 répétitions''',
      imagePath: 'assets/exercises/pied_talon.jpg',
      detailImagePath: 'assets/exercises/pied_talon_detail.jpg',
    ),
    Exercise(
      id: '18',
      name: 'Marche sur surfaces variées',
      description: 'Stimulation sensorielle',
      equipmentId: '2',
      instructions: '''
1. Marchez sur différents textures
2. 5 minutes par jour
3. Augmentez progressivement''',
      imagePath: 'assets/exercises/pied_textures.jpg',
      detailImagePath: 'assets/exercises/pied_textures_detail.jpg',
    ),

    // =============== PROTHÈSE (REF-003) - 9 exercices ===============
    Exercise(
      id: '19',
      name: 'Adaptation de base',
      description: 'Apprentissage des mouvements',
      equipmentId: '3',
      instructions: '''
1. Installation correcte
2. Mouvements de base
3. 5 séries de 8 répétitions''',
      imagePath: 'assets/exercises/prothese_adaptation.jpg',
      detailImagePath: 'assets/exercises/prothese_adaptation_detail.jpg',
    ),
    Exercise(
      id: '20',
      name: 'Contrôle musculaire',
      description: 'Maîtrise des mouvements',
      equipmentId: '3',
      instructions: '''
1. Contractions isolées
2. Mouvements précis
3. 4 séries de 6 répétitions''',
      imagePath: 'assets/exercises/prothese_controle.jpg',
      detailImagePath: 'assets/exercises/prothese_controle_detail.jpg',
    ),
    Exercise(
      id: '21',
      name: 'Précision des gestes',
      description: 'Mouvements fins',
      equipmentId: '3',
      instructions: '''
1. Manipulation d'objets petits
2. 10 minutes par jour
3. Augmentez la difficulté''',
      imagePath: 'assets/exercises/prothese_precision.jpg',
      detailImagePath: 'assets/exercises/prothese_precision_detail.jpg',
    ),
    Exercise(
      id: '22',
      name: 'Force de préhension',
      description: 'Renforcement musculaire',
      equipmentId: '3',
      instructions: '''
1. Saisir et maintenir des objets
2. Augmenter progressivement le poids
3. 5 séries de 5 répétitions''',
      imagePath: 'assets/exercises/prothese_force.jpg',
      detailImagePath: 'assets/exercises/prothese_force_detail.jpg',
    ),
    Exercise(
      id: '23',
      name: 'Coordination bilatérale',
      description: 'Synchronisation des mouvements',
      equipmentId: '3',
      instructions: '''
1. Exercices à deux mains
2. Mouvements coordonnés
3. 10 minutes quotidiennes''',
      imagePath: 'assets/exercises/prothese_coordination.jpg',
      detailImagePath: 'assets/exercises/prothese_coordination_detail.jpg',
    ),
    Exercise(
      id: '24',
      name: 'Endurance musculaire',
      description: 'Résistance à la fatigue',
      equipmentId: '3',
      instructions: '''
1. Mouvements prolongés
2. Augmenter progressivement la durée
3. 3 séries de 2 minutes''',
      imagePath: 'assets/exercises/prothese_endurance.jpg',
      detailImagePath: 'assets/exercises/prothese_endurance_detail.jpg',
    ),
    Exercise(
      id: '25',
      name: 'Mouvements complexes',
      description: 'Combinaison de gestes',
      equipmentId: '3',
      instructions: '''
1. Enchaînement de mouvements
2. Commencez lentement
3. 5 répétitions par séquence''',
      imagePath: 'assets/exercises/prothese_complexe.jpg',
      detailImagePath: 'assets/exercises/prothese_complexe_detail.jpg',
    ),
    Exercise(
      id: '26',
      name: 'Rééducation fonctionnelle',
      description: 'Gestes du quotidien',
      equipmentId: '3',
      instructions: '''
1. Simuler des activités quotidiennes
2. 15 minutes par session
3. Varier les exercices''',
      imagePath: 'assets/exercises/prothese_fonctionnel.jpg',
      detailImagePath: 'assets/exercises/prothese_fonctionnel_detail.jpg',
    ),
    Exercise(
      id: '27',
      name: 'Contrôle de pression',
      description: 'Gestion de la force',
      equipmentId: '3',
      instructions: '''
1. Manipulation d'objets fragiles
2. Apprendre à moduler la force
3. 10 minutes quotidiennes''',
      imagePath: 'assets/exercises/prothese_pression.jpg',
      detailImagePath: 'assets/exercises/prothese_pression_detail.jpg',
    ),

    // =============== MAIN COMPLET (REF-004) - 9 exercices ===============
    Exercise(
      id: '28',
      name: 'Prise palmaire complète',
      description: 'Force de préhension totale',
      equipmentId: '4',
      instructions: '''
1. Saisir un objet large
2. Maintenir 10 secondes
3. 5 répétitions''',
      imagePath: 'assets/exercises/complet_prise.jpg',
      detailImagePath: 'assets/exercises/complet_prise_detail.jpg',
    ),
    Exercise(
      id: '29',
      name: 'Opposition pouce complet',
      description: 'Coordination digitale',
      equipmentId: '4',
      instructions: '''
1. Toucher chaque doigt avec le pouce
2. 3 séries de 10 mouvements
3. Augmenter la vitesse''',
      imagePath: 'assets/exercises/complet_opposition.jpg',
      detailImagePath: 'assets/exercises/complet_opposition_detail.jpg',
    ),
    Exercise(
      id: '30',
      name: 'Étirement complet',
      description: 'Assouplissement global',
      equipmentId: '4',
      instructions: '''
1. Étendre tous les doigts
2. Maintenir 15 secondes
3. 5 répétitions''',
      imagePath: 'assets/exercises/complet_etirement.jpg',
      detailImagePath: 'assets/exercises/complet_etirement_detail.jpg',
    ),
    Exercise(
      id: '31',
      name: 'Force digitale',
      description: 'Renforcement individuel',
      equipmentId: '4',
      instructions: '''
1. Résistance pour chaque doigt
2. 5 secondes par doigt
3. 3 séries''',
      imagePath: 'assets/exercises/complet_force.jpg',
      detailImagePath: 'assets/exercises/complet_force_detail.jpg',
    ),
    Exercise(
      id: '32',
      name: 'Dextérité fine',
      description: 'Précision avancée',
      equipmentId: '4',
      instructions: '''
1. Manipulation de petits objets
2. 10 minutes par jour
3. Varier les exercices''',
      imagePath: 'assets/exercises/complet_dexterite.jpg',
      detailImagePath: 'assets/exercises/complet_dexterite_detail.jpg',
    ),
    Exercise(
      id: '33',
      name: 'Coordination main-bras',
      description: 'Mouvements intégrés',
      equipmentId: '4',
      instructions: '''
1. Exercices combinant main et bras
2. 3 séries de 8 répétitions
3. Contrôle du mouvement''',
      imagePath: 'assets/exercises/complet_coordination.jpg',
      detailImagePath: 'assets/exercises/complet_coordination_detail.jpg',
    ),
    Exercise(
      id: '34',
      name: 'Endurance musculaire',
      description: 'Résistance prolongée',
      equipmentId: '4',
      instructions: '''
1. Maintenir des positions
2. Augmenter progressivement
3. 3 séries de 1 minute''',
      imagePath: 'assets/exercises/complet_endurance.jpg',
      detailImagePath: 'assets/exercises/complet_endurance_detail.jpg',
    ),
    Exercise(
      id: '35',
      name: 'Mouvements complexes',
      description: 'Enchaînements avancés',
      equipmentId: '4',
      instructions: '''
1. Combinaison de gestes
2. 5 répétitions par séquence
3. Augmenter la complexité''',
      imagePath: 'assets/exercises/complet_complexe.jpg',
      detailImagePath: 'assets/exercises/complet_complexe_detail.jpg',
    ),
    Exercise(
      id: '36',
      name: 'Rééducation fonctionnelle',
      description: 'Gestes quotidiens',
      equipmentId: '4',
      instructions: '''
1. Simuler des activités courantes
2. 15 minutes par session
3. Varier les exercices''',
      imagePath: 'assets/exercises/complet_fonctionnel.jpg',
      detailImagePath: 'assets/exercises/complet_fonctionnel_detail.jpg',
    ),
  ];
  List<Exercise> get filteredExercises =>
      allExercises.where((ex) => ex.equipmentId == equipmentId).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercices $equipmentName'),
      ),
      body: _buildExercisesGrid(),
    );
  }

  Widget _buildExercisesGrid() {
    if (filteredExercises.isEmpty) {
      return const Center(
        child: Text('Aucun exercice disponible pour cette pièce'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: filteredExercises.length,
      itemBuilder: (context, index) => _buildExerciseCard(context, filteredExercises[index]),
    );
  }

  Widget _buildExerciseCard(BuildContext context, Exercise exercise) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToExerciseDetail(context, exercise),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseImage(exercise),
            _buildExerciseInfo(exercise),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseImage(Exercise exercise) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          exercise.imagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey[200],
            child: const Center(
              child: Icon(Icons.fitness_center, size: 40, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseInfo(Exercise exercise) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exercise.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            exercise.description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  void _navigateToExerciseDetail(BuildContext context, Exercise exercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailPage(exercise: exercise),
      ),
    );
  }
}