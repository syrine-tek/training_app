import 'package:flutter/material.dart';
import '../models/exercise.dart';
import 'exercise_detail.dart';

class ExercisesPage extends StatefulWidget {
  final String equipmentId;
  final String equipmentName;

  const ExercisesPage({
    super.key,
    required this.equipmentId,
    required this.equipmentName,
  });

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  late List<Exercise> filteredExercises;

  @override
  void initState() {
    super.initState();
    _filterExercises();
  }

  void _filterExercises() {
    setState(() {
      filteredExercises = _ExercisesPageState.allExercises
          .where((ex) => ex.equipmentId == widget.equipmentId)
          .map((ex) => ex.copyWith())
          .toList() as List<Exercise>;
    });
  }

  static const List<Exercise> allExercises = [
    // =============== MAINS (REF-001) - 9 exercices ===============
    const Exercise(
      id: '1',
      name: 'Flexion des doigts',
      description: 'Renforce la flexibilité des doigts',
      equipmentId: '1',
      instructions: '''
1. Placez votre main à plat sur une table
2. Fléchissez chaque doigt un à un
3. Maintenez 5 secondes
4. 10 répétitions par doigt''',
      imagePath: 'assets/mains/flexionDoigts.png',
      detailImagePath: 'assets/mains/flexionDoigts.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 250,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '2',
      name: 'Rotation du poignet',
      description: 'Améliore la mobilité du poignet',
      equipmentId: '1',
      instructions: '''
1. Bras plié à 90°
2. Tournez la paume vers le ciel puis le sol
3. Mouvement lent et contrôlé
4. 3 séries de 15 rotations''',
      imagePath: 'assets/mains/rotationDupoignet.png',
      detailImagePath: 'assets/mains/rotationDupoignet.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '3',
      name: 'Pince pouce-index',
      description: 'Développe la précision digitale',
      equipmentId: '1',
      instructions: '''
1. Touchez le pouce avec chaque doigt successivement
2. Maintenez 2 secondes à chaque contact
3. 5 séries de 10 mouvements''',
      imagePath: 'assets/mains/pincePouce.png',
      detailImagePath: 'assets/mains/pincePouce.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 250,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '4',
      name: 'Levée de poids légers',
      description: 'Renforcement musculaire',
      equipmentId: '1',
      instructions: '''
1. Tenez un poids de 0.5kg
2. Flexion/extension du poignet
3. 4 séries de 8 répétitions''',
      imagePath: 'assets/mains/leveeDePoidsLegers.png',
      detailImagePath: 'assets/mains/leveeDePoidsLegers.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '5',
      name: 'Étirement global',
      description: 'Assouplissement articulaire',
      equipmentId: '1',
      instructions: '''
1. Étendez tous les doigts vers l'arrière
2. Maintenez 10 secondes
3. 5 répétitions par position''',
      imagePath: 'assets/mains/etirementGlobal.png',
      detailImagePath: 'assets/mains/etirementGlobal.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 200,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '6',
      name: 'Manipulation de pièces',
      description: 'Améliore la dextérité',
      equipmentId: '1',
      instructions: '''
1. Disposez 10 pièces sur une table
2. Retournez-les une à une
3. Chronométrez votre temps''',
      imagePath: 'assets/mains/manipulationPiece.png',
      detailImagePath: 'assets/mains/manipulationPiece.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 150,
      detailImageWidth: 250,
    ),
    const Exercise(
      id: '7',
      name: 'Exercice de résistance',
      description: 'Force de préhension',
      equipmentId: '1',
      instructions: '''
1. Serrez une balle molle
2. Maintenez 7 secondes
3. 8 répétitions avec 30s repos''',
      imagePath: 'assets/mains/exerciceDeresistance.png',
      detailImagePath: 'assets/mains/exerciceDeresistance.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 250,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '8',
      name: 'Tapping des doigts',
      description: 'Coordination digitale',
      equipmentId: '1',
      instructions: '''
1. Tapez successivement sur la table
2. Commencez lentement puis accélérez
3. 3 minutes sans pause''',
      imagePath: 'assets/mains/tappingDesDoigts.png',
      detailImagePath: 'assets/mains/tappingDesDoigts.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '9',
      name: 'Écriture simulée',
      description: 'Contrôle moteur fin',
      equipmentId: '1',
      instructions: '''
1. Tenez un stylo adapté
2. Tracez des lettres dans l'air
3. 5 minutes d'exercice''',
      imagePath: 'assets/mains/ecritureSimulee.png',
      detailImagePath: 'assets/mains/ecritureSimulee.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 100,
      detailImageWidth: 300,
    ),

    // =============== PIEDS (REF-002) - 9 exercices ===============
    const Exercise(
      id: '10',
      name: 'Flexion plantaire',
      description: 'Renforce la cheville et les orteils',
      equipmentId: '2',
      instructions: '''
1. Asseyez-vous jambes tendues
2. Pointez les orteils vers l'avant
3. 10 répétitions''',
      imagePath: 'assets/pieds/flexionPlantaire.png',
      detailImagePath: 'assets/pieds/flexionPlantaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '11',
      name: 'Rotation de cheville',
      description: 'Améliore la mobilité articulaire',
      equipmentId: '2',
      instructions: '''
1. Pied levé légèrement du sol
2. Rotation horaire et anti-horaire
3. 3 séries de 10 rotations''',
      imagePath: 'assets/pieds/rotationCheville.png',
      detailImagePath: 'assets/pieds/rotationCheville.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '12',
      name: 'Marche sur place',
      description: 'Renforcement général',
      equipmentId: '2',
      instructions: '''
1. Debout, tenir un support
2. Lever alternativement les talons
3. 3 séries de 15 répétitions''',
      imagePath: 'assets/pieds/marcheSurPlace.png',
      detailImagePath: 'assets/pieds/marcheSurPlace.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '13',
      name: 'Étirement des orteils',
      description: 'Assouplit les articulations',
      equipmentId: '2',
      instructions: '''
1. Tirez doucement sur chaque orteil
2. Maintenez 10 secondes
3. Répétez 3 fois''',
      imagePath: 'assets/pieds/etirementDesOrteils.png',
      detailImagePath: 'assets/pieds/etirementDesOrteils.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '14',
      name: 'Equilibre unipodal',
      description: 'Améliore la proprioception',
      equipmentId: '2',
      instructions: '''
1. Tenez-vous sur un pied
2. Maintenez 30 secondes
3. Changez de pied''',
      imagePath: 'assets/pieds/equilibreUnipodal.png',
      detailImagePath: 'assets/pieds/equilibreUnipodal.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '15',
      name: 'Resistance élastique',
      description: 'Force musculaire',
      equipmentId: '2',
      instructions: '''
1. Fixez un élastique autour du pied
2. Résistance en flexion/extension
3. 3 séries de 12 répétitions''',
      imagePath: 'assets/pieds/resistanceElastique.png',
      detailImagePath: 'assets/pieds/resistanceElastique.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '16',
      name: 'Mouvement circulaire',
      description: 'Coordination motrice',
      equipmentId: '2',
      instructions: '''
1. Tracez des cercles avec le pied
2. 10 rotations dans chaque sens
3. 3 séries''',
      imagePath: 'assets/pieds/mouvementCirculaire.png',
      detailImagePath: 'assets/pieds/mouvementCirculaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '17',
      name: 'Soulèvement de talon',
      description: 'Renforce les mollets',
      equipmentId: '2',
      instructions: '''
1. Debout, levez les talons
2. Maintenez 5 secondes
3. 15 répétitions''',
      imagePath: 'assets/pieds/soulevemntDeTalon.png',
      detailImagePath: 'assets/pieds/soulevemntDeTalon.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),
    const Exercise(
      id: '18',
      name: 'Marche sur surfaces variées',
      description: 'Stimulation sensorielle',
      equipmentId: '2',
      instructions: '''
1. Marchez sur différents textures
2. 5 minutes par jour
3. Augmentez progressivement''',
      imagePath: 'assets/pieds/marcheSurSurface.png',
      detailImagePath: 'assets/pieds/marcheSurSurface.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 200,
    ),

    // =============== AVANT-BRAS (REF-003) - 9 exercices ===============
    const Exercise(
      id: '19',
      name: 'Adaptation de base',
      description: 'Apprentissage des mouvements',
      equipmentId: '3',
      instructions: '''
1. Installation correcte
2. Mouvements de base
3. 5 séries de 8 répétitions''',
      imagePath: 'assets/avantBras/adaptationDebase.png',
      detailImagePath: 'assets/avantBras/adaptationDebase.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '20',
      name: 'Contrôle musculaire',
      description: 'Maîtrise des mouvements',
      equipmentId: '3',
      instructions: '''
1. Contractions isolées
2. Mouvements précis
3. 4 séries de 6 répétitions''',
      imagePath: 'assets/avantBras/controleMusculaire.png',
      detailImagePath: 'assets/avantBras/controleMusculaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '21',
      name: 'Précision des gestes',
      description: 'Mouvements fins',
      equipmentId: '3',
      instructions: '''
1. Manipulation d'objets petits
2. 10 minutes par jour
3. Augmentez la difficulté''',
      imagePath: 'assets/avantBras/precisionDesGestes.png',
      detailImagePath: 'assets/avantBras/precisionDesGestes.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '22',
      name: 'Force de préhension',
      description: 'Renforcement musculaire',
      equipmentId: '3',
      instructions: '''
1. Saisir et maintenir des objets
2. Augmenter progressivement le poids
3. 5 séries de 5 répétitions''',
      imagePath: 'assets/avantBras/forceDePrehension.png',
      detailImagePath: 'assets/avantBras/forceDePrehension.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '23',
      name: 'Coordination bilatérale',
      description: 'Synchronisation des mouvements',
      equipmentId: '3',
      instructions: '''
1. Exercices à deux mains
2. Mouvements coordonnés
3. 10 minutes quotidiennes''',
      imagePath: 'assets/avantBras/coordinationBilaterale.png',
      detailImagePath: 'assets/avantBras/coordinationBilaterale.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '24',
      name: 'Endurance musculaire',
      description: 'Résistance à la fatigue',
      equipmentId: '3',
      instructions: '''
1. Mouvements prolongés
2. Augmenter progressivement la durée
3. 3 séries de 2 minutes''',
      imagePath: 'assets/avantBras/enduranceMusculaire.png',
      detailImagePath: 'assets/avantBras/enduranceMusculaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '25',
      name: 'Mouvements complexes',
      description: 'Combinaison de gestes',
      equipmentId: '3',
      instructions: '''
1. Enchaînement de mouvements
2. Commencez lentement
3. 5 répétitions par séquence''',
      imagePath: 'assets/avantBras/mouvementsComplexe.png',
      detailImagePath: 'assets/avantBras/mouvementsComplexe.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '26',
      name: 'Rééducation fonctionnelle',
      description: 'Gestes du quotidien',
      equipmentId: '3',
      instructions: '''
1. Simuler des activités quotidiennes
2. 15 minutes par session
3. Varier les exercices''',
      imagePath: 'assets/avantBras/reeducationFonctionnelle.png',
      detailImagePath: 'assets/avantBras/reeducationFonctionnelle.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '27',
      name: 'Contrôle de pression',
      description: 'Gestion de la force',
      equipmentId: '3',
      instructions: '''
1. Manipulation d'objets fragiles
2. Apprendre à moduler la force
3. 10 minutes quotidiennes''',
      imagePath: 'assets/avantBras/controleDePresion.png',
      detailImagePath: 'assets/avantBras/controleDePresion.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),

    // =============== Bras(REF-004) - 9 exercices ===============
    const Exercise(
      id: '28',
      name: 'Prise palmaire complète',
      description: 'Force de préhension totale',
      equipmentId: '4',
      instructions: '''
1. Saisir un objet large
2. Maintenir 10 secondes
3. 5 répétitions''',
      imagePath: 'assets/bras/prisePalmaire.png',
      detailImagePath: 'assets/bras/prisePalmaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '29',
      name: 'Opposition pouce complet',
      description: 'Coordination digitale',
      equipmentId: '4',
      instructions: '''
1. Toucher chaque doigt avec le pouce
2. 3 séries de 10 mouvements
3. Augmenter la vitesse''',
      imagePath: 'assets/bras/oppositionPouceComplet.png',
      detailImagePath: 'assets/bras/oppositionPouceComplet.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '30',
      name: 'Étirement complet',
      description: 'Assouplissement global',
      equipmentId: '4',
      instructions: '''
1. Étendre tous les doigts
2. Maintenir 15 secondes
3. 5 répétitions''',
      imagePath: 'assets/bras/etirementComplet.png',
      detailImagePath: 'assets/bras/etirementComplet.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '31',
      name: 'Force digitale',
      description: 'Renforcement individuel',
      equipmentId: '4',
      instructions: '''
1. Résistance pour chaque doigt
2. 5 secondes par doigt
3. 3 séries''',
      imagePath: 'assets/bras/forceDigitale.png',
      detailImagePath: 'assets/bras/forceDigitale.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 300,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '32',
      name: 'Dextérité fine',
      description: 'Précision avancée',
      equipmentId: '4',
      instructions: '''
1. Manipulation de petits objets
2. 10 minutes par jour
3. Varier les exercices''',
      imagePath: 'assets/bras/dexteriteFine.png',
      detailImagePath: 'assets/bras/dexteriteFine.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '33',
      name: 'Coordination main-bras',
      description: 'Mouvements intégrés',
      equipmentId: '4',
      instructions: '''
1. Exercices combinant main et bras
2. 3 séries de 8 répétitions
3. Contrôle du mouvement''',
      imagePath: 'assets/bras/coordinationMain.png',
      detailImagePath: 'assets/bras/coordinationMain.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '34',
      name: 'Endurance musculaire',
      description: 'Résistance prolongée',
      equipmentId: '4',
      instructions: '''
1. Maintenir des positions
2. Augmenter progressivement
3. 3 séries de 1 minute''',
      imagePath: 'assets/bras/enduranceMusculaire.png',
      detailImagePath: 'assets/bras/enduranceMusculaire.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 450,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '35',
      name: 'Mouvements complexes',
      description: 'Enchaînements avancés',
      equipmentId: '4',
      instructions: '''
1. Combinaison de gestes
2. 5 répétitions par séquence
3. Augmenter la complexité''',
      imagePath: 'assets/bras/mouvementComplexe.png',
      detailImagePath: 'assets/bras/mouvementComplexe.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
    const Exercise(
      id: '36',
      name: 'Rééducation fonctionnelle',
      description: 'Gestes quotidiens',
      equipmentId: '4',
      instructions: '''
1. Simuler des activités courantes
2. 15 minutes par session
3. Varier les exercices''',
      imagePath: 'assets/bras/reducationFon.png',
      detailImagePath: 'assets/bras/reducationFon.png',
      thumbnailHeight: 120,
      thumbnailWidth: 120,
      detailImageHeight: 350,
      detailImageWidth: 300,
    ),
  ];

  void _handleExerciseCompleted(Exercise completedExercise) {
    setState(() {
      final index = filteredExercises.indexWhere((ex) => ex.id == completedExercise.id);
      if (index != -1) {
        filteredExercises[index] = filteredExercises[index].copyWith(isCompleted: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercices ${widget.equipmentName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
          ),
        ],
      ),
      body: _buildExercisesGrid(),
    );
  }

  Widget _buildExercisesGrid() {
    if (filteredExercises.isEmpty) {
      return const Center(
        child: Text(
          'Aucun exercice disponible pour cette catégorie',
          style: TextStyle(fontSize: 18),
        ),
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
      child: Stack(
        children: [
          InkWell(
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
          if (exercise.isCompleted)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExerciseImage(Exercise exercise) {
    return Expanded(
      child: Container(
        height: exercise.thumbnailHeight ?? 120,
        width: exercise.thumbnailWidth ?? 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          color: Colors.grey[200],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            exercise.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Center(
              child: Icon(
                Icons.fitness_center,
                size: 40,
                color: Colors.grey[400],
              ),
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
          if (exercise.isCompleted)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Terminé',
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _navigateToExerciseDetail(BuildContext context, Exercise exercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailPage(
          exercise: exercise,
          onExerciseCompleted: _handleExerciseCompleted,
        ),
      ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filtrer les exercices',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.all_inclusive),
                title: const Text('Tous les exercices'),
                onTap: () {
                  _filterExercises();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: const Text('Exercices terminés'),
                onTap: () {
                  setState(() {
                    filteredExercises = filteredExercises.where((ex) => ex.isCompleted).toList();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                title: const Text('Exercices non terminés'),
                onTap: () {
                  setState(() {
                    filteredExercises = filteredExercises.where((ex) => !ex.isCompleted).toList();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}