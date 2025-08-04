import 'package:flutter/material.dart';
import '../models/exercise.dart';
import 'ExerciseExecutionPage.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;
  final Function(Exercise) onExerciseCompleted;

  const ExerciseDetailPage({
    super.key,
    required this.exercise,
    required this.onExerciseCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Ajouter aux favoris
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'exercise_${exercise.id}',
              child: Center(
                child: Container(
                  height: exercise.detailImageHeight ?? 250,
                  width: exercise.detailImageWidth ?? double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      exercise.detailImagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Center(
                        child: Icon(
                          Icons.fitness_center,
                          size: 50,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            _buildSectionTitle(context, 'Description'),
            const SizedBox(height: 8),
            _buildSectionContent(exercise.description),
            const SizedBox(height: 25),
            _buildSectionTitle(context, 'Instructions'),
            const SizedBox(height: 8),
            ..._buildInstructionSteps(exercise.instructions),
            const SizedBox(height: 30),
            _buildCompleteButton(context),
            const SizedBox(height: 16),
            _buildStartButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Colors.grey[800],
      ),
    );
  }

  List<Widget> _buildInstructionSteps(String instructions) {
    final steps = instructions
        .split('\n')
        .where((step) => step.trim().isNotEmpty)
        .toList();
    return steps.map((step) => _buildStepItem(step)).toList();
  }

  Widget _buildStepItem(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          Expanded(
            child: Text(
              step.trim(),
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onExerciseCompleted(exercise);
          Navigator.pop(context);

          // Afficher un message de confirmation
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${exercise.name} marqué comme terminé'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'TERMINER L\'EXERCICE',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseExecutionPage(exercise: exercise),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'COMMENCER L\'EXERCICE',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}