import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/home_page.dart';
import 'screens/signup_page.dart';
import 'screens/equipment_selection.dart';
import 'screens/exercises_page.dart';
import 'screens/exercise_detail.dart';
import 'models/exercise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const HandyTrainerApp());
}

class HandyTrainerApp extends StatelessWidget {
  const HandyTrainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HandyTrainer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        cardTheme: CardThemeData( // Correction ici
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)), // Correction ici
          ),
          margin: EdgeInsets.zero,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWrapper(),
        '/signup': (context) => const SignupPage(),
        '/equipment': (context) => const EquipmentSelectionPage(),
      },
      onGenerateRoute: (settings) {
        // Route pour la page des exercices
        if (settings.name == '/exercises') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ExercisesPage(
              equipmentId: args['equipmentId'],
              equipmentName: args['equipmentName'] ?? '',
            ),
          );
        }

        // Route pour les détails d'exercice
        if (settings.name == '/exercise-detail') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ExerciseDetailPage(
              exercise: args['exercise'] as Exercise,
              onExerciseCompleted: args['onExerciseCompleted'] as Function(Exercise),
            ),
          );
        }
        return null;
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Pendant le chargement
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Si l'utilisateur est connecté
        if (snapshot.hasData) {
          return const EquipmentSelectionPage();
        }

        // Si l'utilisateur n'est pas connecté
        return const HomePage();
      },
    );
  }
}