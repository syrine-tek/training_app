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
import 'models/equipment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase avec les options par plateforme
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
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.zero,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthWrapper(),
        '/signup': (context) => const SignupPage(),
        '/equipment': (context) => const EquipmentSelectionPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/exercises') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ExercisesPage(
              equipmentId: args['equipmentId'],
            ),
          );
        }

        if (settings.name == '/exercise-detail') {
          final exercise = settings.arguments as Exercise;
          return MaterialPageRoute(
            builder: (context) => ExerciseDetailPage(exercise: exercise),
          );
        }
        return null;
      },
    );
  }
}

// Widget séparé pour gérer l'état d'authentification
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Gestion de l'état de connexion
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Redirection en fonction de l'état d'authentification
        if (snapshot.hasData) {
          return const EquipmentSelectionPage();
        }
        return const HomePage();
      },
    );
  }
}