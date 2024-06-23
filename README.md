# Quiz App

Quiz App is a mobile application developed using Flutter, designed to provide users with an engaging and educational experience through multiple-choice quizzes. This app is built with a focus on responsiveness and scalability, utilizing state management, custom theming, and responsive UI design.

## Features

- **Multiple Categories:** Users can choose from various quiz categories.
- **Progress Indicator:** Linear progress bar to show quiz progress.
- **Responsive Design:** Adapts to different screen sizes using `flutter_screenutil`.
- **Results Screen:** Displays user's score at the end of the quiz.

## Tech Stack

- **Flutter:** Framework for building natively compiled applications for mobile.
- **Provider:** State management solution for managing app state efficiently.
- **auto_size_text:** Automatically adjusts text size to fit within bounds.
- **flutter_screenutil:** For responsive and adaptive UI design.

## Architecture

The app follows a structured architecture to maintain separation of concerns and scalability:

- **Models:** Defines the data structures used in the app (`questions_model.dart`).
- **ViewModels:** Contains business logic and state management (`quiz_viewmodel.dart`, `categories_viewmodel.dart`).
- **Views:** The UI components of the app (`quiz_screen.dart`, `result_screen.dart`).
- **Widgets:** Reusable UI components (`question_card.dart`).
- **Theme:** Custom theming for consistent design (`custom_color.dart`).

## Directory Structure

```plaintext
lib
├── main.dart
├── models
│   └── questions_model.dart
├── theme
│   └── custom_color.dart
├── viewmodels
│   ├── categories_viewmodel.dart
│   └── quiz_viewmodel.dart
├── views
│   ├── quiz_screen.dart
│   └── result_screen.dart
└── widgets
    └── question_card.dart
