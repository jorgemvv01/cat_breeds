# Cat Breeds - Riverpod

This is a mobile application that allows querying cat breeds using The Cat API. It was developed with Flutter using state management packages such as Riverpod and http for REST requests.

The application was developed following a clean architecture.

## Minimum Required SDK:

Flutter 3.19.2

## Getting Started

To run the project, follow these steps:


**Step 1:**

Download or clone this repository using the following link:

```
https://github.com/jorgemvv01/cat_breeds
```

**Step 2:**

Create an .env file in the root of the project with the following information:

```
API_KEY=YOUR_API_KEY_VALUE
```

**Step 3:**

Go to the project root and run the following command in the console to get the necessary dependencies:

```
flutter pub get 
```

**Step 4:**

Running unit and widget tests:

```
flutter test 
```

**Step 5:**

Execute integration tests:

```
flutter test integration_test
```

**Step 6:**

Finally, run the project with the following command:

```
flutter run
```


### Test coverage
Coverage of the tests can be found at:
```
coverage/html/index.html
```
![UI](https://github.com/jorgemvv01/cat_breeds/blob/main/resource/images/coverage.png)

### Folder Structures
This is the basic folder structure used to develop the project:

```
flutter-app/
|- android
|- ios
|- lib
|---- config/
|---- l10n/
|---- domain/
|---- infrastructure/
|---- presentation/
|---- main.dart
|- linux
|- macos
|- resource
|- test
|- web
|- windows
```

This is the base folder structure used to manage a type of hexagonal architecture:

```
lib/
|- domain/
|- infrastructure/
|- presentation/
|- main.dart
```
