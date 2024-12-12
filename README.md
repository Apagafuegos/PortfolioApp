# Portfolio App

This Flutter project is a portfolio application that showcases various projects and skills. The app is structured into multiple pages and widgets to ensure a clean and maintainable codebase.

## Project Structure

The project is organized into the following main directories:

- `lib/`
    - `main.dart`: The entry point of the application.
    - `pages/`: Contains all the pages/screens of the app.
    - `widgets/`: Contains reusable widgets used across different pages.
    - `models/`: Contains data models used in the app.

## Pages

### Start Screen

`start_screen.dart` is the main landing page of the app. It includes my name and a picture.

### Projects Screen

`main_screen.dart` displays some basic information about me, as well as the different parts that build the app.

### Technologies Screen

`technologies_screen.dart` lists all the technologies I use as well as a link to them.

### Projects Screen

`projects_screen.dart` provides a list of all my public repos in GitHub using the GitHub API.

### Project Detail Screen
`project_detail_screen.dart` gives a more profound detail about each project as well as a link to the repo.

### Contact Screen
`contact_screen.dart` contains direct links to communicate with me.

### Competences Screen
`competences_screen.dart` contains all my competences.

## Widgets

### StyledButton

The `StyledButton` widget is a customizable button used throughout the app. It allows for various styles and configurations to match the design requirements of different pages. The button includes properties for text, color, and onPressed callback, making it versatile and reusable.

Example usage:
```dart
StyledButton(
    text: 'Click Me',
    color: Colors.blue,
    onPressed: () {
        // Handle button press
    },
)
```

### StyledText

The `StyledText` widget is a customizable text widget used throughout the app. It allows for various styles and configurations to match the design requirements of different pages. The widget includes properties for text content, font size, color, and font weight, making it versatile and reusable.

Example usage:
```dart
StyledText(
    text: 'Hello, World!',
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
)
```

### StyledAppBar

The `StyledAppBar` widget is a customizable app bar used throughout the app. It allows for various styles and configurations to match the design requirements of different pages. The app bar includes properties for title, background color, and actions, making it versatile and reusable.

Example usage:
```dart
StyledAppBar(
    title: 'My App',
    backgroundColor: Colors.blue,
    actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
                // Handle settings button press
            },
        ),
    ],
)
```

## Models

### Project

The `project.dart` model represents a project with properties such as title, description, and link.

### Person

The `person.dart` model represents a skill with properties such as name and icon.

### Technology

The `technology.dart` model represents a technology with properties such as name, icon, and link.

## Conclusion

This could've been more easily made, but I wanted to make a more expandable app in case someone finds it out interesting and wants to use its skeleton.

Btw, here's the link to the web app (not yet finalised): [Web app](https://portfolio-app-cse-84237.web.app/)
