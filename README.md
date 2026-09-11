# 🏋️ Training App

A Flutter-based mobile application designed to provide users with structured training and rehabilitation exercises for different parts of the body.

The application offers an organized collection of exercises with visual guidance, helping users explore and follow movements targeting areas such as the hands, feet, forearm, and arms.

## ✨ Features

* 🔐 User authentication using Firebase Authentication
* 📱 Cross-platform mobile application built with Flutter
* 🏃 Structured exercise categories
* 🖼️ Visual exercise illustrations
* ✋ Hand and finger exercises
* 🦶 Foot exercises
* 💪 Forearm exercises
* 🦾 Arm and upper limb exercises
* 🗂️ Organized application structure using models and screens
* 🔥 Firebase integration

## 🛠️ Technologies Used

* **Flutter**
* **Dart**
* **Firebase Core**
* **Firebase Authentication**

## 📂 Project Structure

```text
training_app/
│
├── android/                 # Android platform configuration
├── ios/                     # iOS platform configuration
├── web/                     # Web platform configuration
├── windows/                 # Windows platform configuration
├── linux/                   # Linux platform configuration
├── macos/                   # macOS platform configuration
│
├── assets/                  # Application images and exercise illustrations
│   ├── mains/
│   ├── pieds/
│   ├── avantBras/
│   └── bras/
│
├── lib/
│   ├── models/              # Application data models
│   ├── screens/             # Application screens
│   ├── firebase_options.dart
│   └── main.dart
│
├── test/                    # Application tests
│
├── pubspec.yaml             # Project dependencies and configuration
└── README.md
```

## 📱 Exercise Categories

The application includes exercises for different body areas, including:

### ✋ Hands

* Finger flexion
* Wrist rotation
* Thumb exercises
* Finger tapping
* Resistance exercises
* Fine motor activities

### 🦶 Feet

* Plantar flexion
* Single-leg balance
* Toe stretching
* Walking exercises
* Ankle rotation
* Heel raises

### 💪 Forearm

* Grip strength exercises
* Muscle control
* Functional rehabilitation
* Bilateral coordination
* Muscular endurance
* Precision exercises

### 🦾 Arms

* Palmar grip
* Thumb opposition
* Fine dexterity
* Digital strength
* Hand coordination
* Functional rehabilitation
* Stretching and complex movements

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* An Android emulator or physical device

### Installation

1. Clone the repository:

```bash
git clone https://github.com/syrine-tek/training_app.git
```

2. Navigate to the project directory:

```bash
cd training_app
```

3. Install the dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## 🔥 Firebase Configuration

This project uses Firebase services, including Firebase Authentication.

Before running the application, make sure that your Firebase project is correctly configured for your target platforms.

