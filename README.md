
# MVVM-UseCases

This project demonstrates an iOS application developed using the MVVM architecture with Use Cases, which fetches the top movies from the https://rss.itunes.apple.com/api/. The application is designed with modularity, testability, and flexibility in mind.

## About the Project

This project is a simple top movies application developed using the MVVM architecture and incorporating Use Cases. The application fetches the top movies from the iTunes RSS API and displays them on the screen. The app's structure allows for easy testing and makes the code more maintainable.

## MVVM Architecture Components

MVVM consists of **Model**, **View**, and **ViewModel** components.

- **Model**: Represents the data models and business logic of the application. This layer handles database operations, API requests, and other business logic-related tasks.
- **View**: Manages the user interface and user interactions. The View sends user inputs to the ViewModel and updates the UI based on the data received from the ViewModel.
- **ViewModel**: Acts as a bridge between the View and Model. It passes user inputs from the View to the Model and prepares data from the Model for the View. The ViewModel does not directly communicate with the View; instead, the View observes the ViewModel to respond to data changes.

## Use Cases

Use Cases define specific tasks or workflows to be performed within the application. In this project, Use Cases help organize and modularize the business logic. They can be reused across different parts of the app and can be tested independently.

For this project, a primary Use Case is to fetch the top movies from the iTunes RSS API.

## Tests

The project is designed with both integration and unit tests in mind. These tests include:

- **Integration Tests**: Test how different components of the application work together. In these tests, API requests can be mocked to avoid using real network connections.
- **Unit Tests**: Test the independent components of the application. In these tests, the ViewModel and Use Cases can be tested separately.

## Setup

1. Clone or download the project to your local machine.
2. Navigate to the project folder in the terminal and run `pod install` to install dependencies.
3. Open `TopMovies-MVVM-UseCases.xcworkspace` in Xcode.
4. Build and run the project on an iOS simulator or physical device.

## Usage

1. Launch the application.
2. The application will fetch the top movies from the iTunes RSS API and display them on the screen, including titles, artwork, and additional information.
3. Tap on a movie to view more details about the item.

---
