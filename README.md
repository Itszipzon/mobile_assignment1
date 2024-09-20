# **Quiz App with Timer - Flutter Project**

## **Project Overview**

This is a simple cross-platform quiz app developed using **Flutter**. The app allows users to take quizzes on various topics, with a built-in timer to manage the duration of the quiz. Users can answer multiple-choice questions, track their progress, and receive results after completing each quiz. The app also supports a countdown timer that automatically submits answers when time runs out.

### **Key Features**
- **Multiple Choice Questions**: Users can take quizzes with various question formats.
- **Timer Functionality**: Each quiz includes a timer that counts down and submits the quiz automatically when time expires.
- **Results Screen**: After completing a quiz, users can view their score and see which questions were answered correctly.
- **Pause & Resume**: Users can pause and resume a quiz with the timer stopping accordingly (if pausing is enabled).
- **Cross-Platform**: The app is available on both **iOS** and **Android**.

---

## **Project Structure**

The project follows the typical Flutter structure:

- **`lib/`**: Contains the main application code.
  - **`main.dart`**: The entry point of the application.
  - **`models/`**: Contains data models such as `QuizModel` and `QuestionModel` for representing quiz data.
  - **`screens/`**: Contains the UI screens such as `QuizScreen`, `ResultScreen`, and `HomeScreen`.
  - **`widgets/`**: Contains reusable widgets like `QuestionWidget` and `TimerWidget`.
  - **`providers/`**: Manages state using the `Provider` package, including the `QuizProvider` and `TimerProvider`.

- **`assets/`**: Contains static assets like images and fonts (if any).
- **`pubspec.yaml`**: The configuration file for dependencies and assets.

---

## **Getting Started**

### **Prerequisites**
To run this project, you need to have the following installed on your system:
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **Visual Studio Code** for development
- **Android/iOS Emulator** or physical devices to run the app

### **Installation Instructions**
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/flutter-quiz-app.git
    ```
2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```
    Then just follow the instructions in the terminal


## **Collaboration**

- Rune Molander 
- Jan Nordskog