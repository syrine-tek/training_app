import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseExecutionPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseExecutionPage({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseExecutionPageState createState() => _ExerciseExecutionPageState();
}

class _ExerciseExecutionPageState extends State<ExerciseExecutionPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  int _currentStep = 0;
  int _secondsRemaining = 0;
  bool _isCompleted = false;
  bool _isPaused = false;
  late List<String> _steps;
  late List<int> _stepDurations;

  @override
  void initState() {
    super.initState();
    _parseInstructions();
    _initializeTimer();
    _startTimer();
  }

  void _parseInstructions() {
    // Découper les instructions en étapes
    final instructions = widget.exercise.instructions.split('\n').where((line) => line.trim().isNotEmpty).toList();

    _steps = [];
    _stepDurations = [];

    for (var instruction in instructions) {
      // Extraire la durée si mentionnée (ex: "Maintenez 5 secondes")
      final durationMatch = RegExp(r'(\d+)\s+secondes?').firstMatch(instruction);
      final repetitionMatch = RegExp(r'(\d+)\s+répétitions?').firstMatch(instruction);

      int duration = 5; // Durée par défaut
      if (durationMatch != null) {
        duration = int.parse(durationMatch.group(1)!);
      } else if (repetitionMatch != null) {
        duration = 3; // 3 secondes par répétition
      }

      _steps.add(instruction);
      _stepDurations.add(duration);
    }

    // Si aucune durée n'a été trouvée, utiliser des valeurs par défaut
    if (_stepDurations.isEmpty) {
      _steps = ["Préparation", "Exécution", "Récupération"];
      _stepDurations = [5, 10, 5];
    }

    _secondsRemaining = _stepDurations[0];
  }

  void _initializeTimer() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _secondsRemaining),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStep();
      }
    });
  }

  void _startTimer() {
    _isPaused = false;
    _controller.forward(from: 0);
  }

  void _pauseTimer() {
    _isPaused = true;
    _controller.stop();
  }

  void _resumeTimer() {
    _isPaused = false;
    _controller.forward();
  }

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
        _secondsRemaining = _stepDurations[_currentStep];
        _controller.dispose();
        _initializeTimer();
        _startTimer();
      });
    } else {
      setState(() {
        _isCompleted = true;
        _controller.dispose();
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _secondsRemaining = _stepDurations[_currentStep];
        _controller.dispose();
        _initializeTimer();
        _startTimer();
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _isCompleted ? 1.0 : (_currentStep + 1) / _steps.length,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
            minHeight: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Étape actuelle
                  Text(
                    'ÉTAPE ${_currentStep + 1}/${_steps.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _steps[_currentStep],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Timer circulaire
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: _controller.value,
                          strokeWidth: 12,
                          backgroundColor: Colors.grey[200],
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatTime(_secondsRemaining - (_controller.value * _secondsRemaining).toInt()),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_isPaused)
                            const Text(
                              'PAUSE',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Contrôles du timer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!_isCompleted && !_isPaused)
                        IconButton(
                          icon: const Icon(Icons.pause, size: 40),
                          onPressed: _pauseTimer,
                        )
                      else if (!_isCompleted && _isPaused)
                        IconButton(
                          icon: const Icon(Icons.play_arrow, size: 40),
                          onPressed: _resumeTimer,
                        ),
                      if (!_isCompleted)
                        IconButton(
                          icon: const Icon(Icons.skip_next, size: 40),
                          onPressed: _nextStep,
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Boutons de navigation
                  if (!_isCompleted)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_currentStep > 0)
                          TextButton(
                            onPressed: _previousStep,
                            child: const Text('Étape précédente'),
                          ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _nextStep,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            _currentStep < _steps.length - 1
                                ? 'Passer à l\'étape suivante'
                                : 'Terminer l\'exercice',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Exercice terminé!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Retour aux détails',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}