# Submission

## Setup Instructions
To get started with the development, follow these steps:

- Clone the repository to your local machine.
- Navigate to the project directory in your terminal.
- Run flutter pub get to install all the necessary dependencies.
- Run flutter pub get inside the directory packages/data/
- Open your preferred IDE and start building the application.
- Install Flutter intl plugin for marketplace [File-> Settings-> Plugins-> Market Place-> Flutter Intl]
- run => flutter pub global activate intl_utils [On Terminal]
- run => flutter pub global run intl_utils:generate [On Terminal]
- run the project with latest sdk

## A list of completed features and any known issues or unimplemented parts of the application.
1. unit/widget test not completed

## Any necessary documentation to understand your design decisions and architecture.
1. Have used clean architecture
2. core - Contains common resources,services and theme etc
3. feature - contains domain layer with repository and model with freezed
4. presentation - contains state management (bloc), pages(UI), common widgets
5. l10n - for localisation, added support for (English, Hindi, Spanish, French) [Change system language]
6. Use main branch

## Features Completed
- **Listing Screen:** Display a scrollable list of Pokémon. Each list item should present at least the name of the Pokémon.
- **Detail Page:** Upon tapping a list item, the app should navigate to a detailed information page for that Pokémon, showing more data, including images.
- **State Management:** Use the BLoC pattern for managing application state.
- **Localization:** Prepare the app for localization with the Flutter Intl package.
- **Networking:** Fetch Pokémon data from an API.

## Additional Features
1. Made provision on home screen to fetch the pokemon data with FAB button.
2. On detail screen made provision to get a single random pokemon with FAB button
3. Used Go Router for navigation
4. Used Skeletonizer package to make the wait worthwhile for the user, create an effect of underlying data until data is fetched
5. Added custom Pokemon fonts on home screen
6. Image caching added
7. Added support to change home layout gridview/Listview
8. added support for custom theme and dark theme as per system (Custom theme only for dev provision made)
9. updated app icon