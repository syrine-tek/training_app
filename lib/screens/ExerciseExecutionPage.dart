import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseExecutionPage extends StatefulWidget {
  final Exercise exercise;

  const ExerciseExecutionPage({Key? key, required this.exercise}) : super(key: key);

  @override
  _ExerciseExecutionPageState createState() => _ExerciseExecutionPageState();
}

class _ExerciseExecutionPageState extends State<ExerciseExecutionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _borderController;
  late Animation<double> _borderAnimation;
  int _currentStep = 0;
  int _totalDuration = 10;
  int _secondsRemaining = 10;
  bool _isCompleted = false;
  bool _isPaused = false;
  late List<String> _steps;

  @override
  void initState() {
    super.initState();
    _parseInstructions();
    _initializeTimers();
    _startTimers();
  }

  void _parseInstructions() {
    final instructions = widget.exercise.instructions
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    _steps = instructions.isNotEmpty ? instructions : ["Préparation", "Exécution", "Récupération"];
    _secondsRemaining = _totalDuration;
  }

  void _initializeTimers() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _totalDuration),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStep();
      }
    });

    _borderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _borderAnimation = Tween<double>(begin: 8, end: 12).animate(
      CurvedAnimation(
        parent: _borderController,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addListener(() {
      setState(() {
        _secondsRemaining = _totalDuration - (_controller.value * _totalDuration).toInt();
      });
    });
  }

  void _startTimers() {
    _isPaused = false;
    _controller.forward(from: _controller.value);
    _borderController.forward();
  }

  void _pauseTimers() {
    _isPaused = true;
    _controller.stop();
    _borderController.stop();
  }

  void _resumeTimers() {
    _isPaused = false;
    _controller.forward();
    _borderController.forward();
  }

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
        _secondsRemaining = _totalDuration;
        _controller.reset();
        _controller.forward();
      });
    } else {
      setState(() {
        _isCompleted = true;
        _disposeTimers();
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _secondsRemaining = _totalDuration;
        _controller.reset();
        _controller.forward();
      });
    }
  }

  void _disposeTimers() {
    _controller.dispose();
    _borderController.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  void dispose() {
    _disposeTimers();
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

                  // Grand cercle unique avec animation
                  AnimatedBuilder(
                    animation: Listenable.merge([_controller, _borderAnimation]),
                    builder: (context, child) {
                      return Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: _borderAnimation.value,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _formatTime(_secondsRemaining),
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
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 40),
                        onPressed: _currentStep > 0 ? _previousStep : null,
                        color: _currentStep > 0 ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(width: 40),

                      if (!_isCompleted && !_isPaused)
                        IconButton(
                          icon: const Icon(Icons.pause, size: 40),
                          onPressed: _pauseTimers,
                          color: Colors.blue,
                        )
                      else if (!_isCompleted && _isPaused)
                        IconButton(
                          icon: const Icon(Icons.play_arrow, size: 40),
                          onPressed: _resumeTimers,
                          color: Colors.blue,
                        ),
                      const SizedBox(width: 40),

                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 40),
                        onPressed: _nextStep,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  if (!_isCompleted)
                    ElevatedButton(
                      onPressed: _nextStep,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
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