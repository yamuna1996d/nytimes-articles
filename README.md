NY Times Articles App

This is a simple Flutter app that uses the NY Times Most Popular Articles API to display a list of articles, and allows users to view the details of individual articles when they tap on an item in the list.

##Getting Started

Prerequisites

To run this app, you will need to have Flutter installed on your system. You can download Flutter from the official website: https://flutter.dev/docs/get-started/install

##Installation
* Clone this repository to your local machine using git clone https://github.com/yamuna1996d/nytimes-articles
* Navigate to the project directory and run flutter pub get to install the required dependencies.
*Replace YOUR_API_KEY in lib/constraints/constraints.dart with your NY Times API key. You can obtain an API key by following the instructions on this page:    https://developer.nytimes.com/get-startedUsage
* To run the app, connect your device to your computer and run flutter run from the project directory.

##Testing

To run the unit tests for this app, run flutter test from the project directory.

##App Architecture

This app uses a simple architecture with two screens:

* HomeScreen: Displays a list of articles retrieved from the NY Times Most Popular Articles API.

* DetailPage: Displays the details of a selected article.

* The app uses the http package to make HTTP requests to the NY Times API.

##StateManagement

Provider
