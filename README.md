# Komodo Trivia - Flutter Quiz App

Welcome to Komodo Trivia, a Flutter mobile application designed for quiz enthusiasts. This app leverages the Open Trivia Database API to provide a dynamic and engaging quiz experience.

## Table of Contents

- [Overview](#overview)
- [User Interface](#user-interface)
- [API Integration](#api-integration)
- [Scoring and Timer](#scoring-and-timer)
- [Error Handling](#error-handling)
- [Code Structure and Organization](#code-structure-and-organization)
- [Unit Testing](#unit-testing)
- [User Experience](#user-experience)
- [Optional Enhancements (Bonus)](#optional-enhancements-bonus)
- [Screenshots](#screenshots)
- [Submission](#submission)

## Overview

The Komodo Trivia app is a Flutter-based mobile application that allows users to participate in quizzes fetched from the Open Trivia Database API. The app includes features such as multiple-choice questions, scoring, timers, and a dynamic user interface.

## User Interface

The app comprises two main screens:

1. **Home Screen:**
    - Displays a list of available quizzes.
    - Users can select a quiz to start.

2. **Quiz Screen:**
    - Presents questions one by one with multiple-choice options.
    - Allows users to select an answer for each question.

## API Integration

The app integrates with the Open Trivia Database API:
- Fetches quiz categories and questions dynamically.
- Handles various question types, including multiple choice and true/false.

For more information about the API, please refer to [Open Trivia Database API](https://opentdb.com/api_config.php).

## Scoring and Timer

- Keeps track of the user's score as they progress through the quiz.
- Implements a timer for each question to ensure timely responses.

## Error Handling

- Properly handles API requests and potential issues.
- Displays error messages if quiz data cannot be fetched.

## Code Structure and Organization

The codebase follows a clean and maintainable architecture:
- Utilizes the BLoC pattern for effective state management.
- Organizes code logically for readability and maintainability.

## Unit Testing

Unit tests have been implemented for critical functions to ensure code reliability.

## User Experience
- Enhances the user experience with smooth animations and transitions.
- Provides instant feedback on the correctness of the user's answers.

## Optional Enhancements (Bonus)
- Users can choose the difficulty level of the quiz.


## Screenshots
![Screenshot](screenshots/1.png)
![Screenshot](screenshots/2.png)
![Screenshot](screenshots/3.png)
![Screenshot](screenshots/4.png)
![Screenshot](screenshots/5.png)

## Submission

To run the app locally, follow these instructions:

1. Clone the repository:

   ```bash
   git clone https://github.com/jsonyung/komodo_trivia.git
