# Weather App 🌦️

This Flutter application allows users to check the weather for different locations, predict if the weather is suitable for playing tennis, and manage authentication for accessing the app's features. The app incorporates several features, including real-time weather information, AI-powered weather predictions, and Firebase authentication.

## Features

### 1. Weather Checking 🌍

#### Home:
- The app fetches the current weather for the user's location. If the user's location services are disabled or unavailable, Alexandria is set as the default location. The user can also manually search for a country's weather.

#### Data Layer:
- **Data Source**: Fetches weather data using an API and returns a `WeatherDataModel`.
- **Models**:
    - `WeatherDataModel`: Contains all the weather data returned from the API.
    - `HoursDataModel`: Holds hourly weather data.
    - `DaysDataModel`: Holds daily weather data.
- **Repository**: Fetches weather data for the provided location.

#### Domain Layer:
- **Entities**: `DayData`, `HoursData`, `WeatherData`.
- **Use Case**: `GetWeatherDataUseCase`.

#### Presentation Layer:
- **Controller**:
    - `GoogleMapCubit`: Handles geolocation, searches, and displays the weather state on the map.
    - `WeatherCubit`: Fetches weather data and adjusts the UI based on the current time.
- **Screens**:
    - `HomeScreen`: Contains the search bar and displays basic weather information.
    - `WeatherStateScreen`: Displays detailed weather data for the selected country.

---

### 2. AI Weather Prediction 🎾

#### Weather Detection:
- This feature uses an AI model to predict if the current weather is suitable for playing tennis.

#### Data Layer:
- **Data Source**: Connects to a local Flask server, passing weather data and returning predictions in `WeatherPredictionDataReturned`.
- **Model**: `WeatherPredictionDataReturned`: Converts the prediction JSON to a numerical result (1 = good weather, 0 = bad weather).
- **Repository**: Fetches the prediction data from the AI model.

#### Domain Layer:
- **Entities**:
    - `WeatherPredictionDataEnter`: Contains weather state data and a `toJson` method for serialization.
    - `WeatherPredictionDataReturned`: Holds the prediction result.
- **Use Case**: `GetPredictionUseCase`.

#### Presentation Layer:
- **Controller**: `GetPredictionCubit`: Fetches the weather prediction from the AI model.
- **Screen**: `PredictionScreen`: Displays whether the weather is suitable for tennis or not.

---

### 3. Authentication 🔐

#### User Authentication:
- The app supports signing in, signing up, and logging out via Firebase Authentication.

#### Data Layer:
- **Data Source**: Uses Firebase for signing in, signing up, and logging out.
- **Model**: `UserModel`: Holds user data returned from Firebase `UserCredential`.
- **Repository**: Handles user authentication through `signInRepo`, `signUpRepo`, and `logoutRepo`.

#### Domain Layer:
- **Entities**:
    - `UserDataEntered`: Holds user data for login and registration.
    - `UserDataReturned`: Contains data returned after login or registration.
- **Use Case**: Separate use cases for sign-in, sign-up, and logout functions.

#### Presentation Layer:
- **Controller**: Two Cubit objects handle authentication states and user data.
- **Screens**:
    - `SplashScreen`: Initial loading screen.
    - `SignScreen`: Allows the user to choose between signing in and signing up.
    - `SignInScreen`: User login page.
    - `SignUpScreen`: User registration page.
    - `ProfileScreen`: Displays the user's profile after successful login.

---

## Video Demo


https://github.com/user-attachments/assets/320291eb-7658-4d79-a793-0c5af6fdb9bd

---

## Getting Started

This project is a starting point for a Flutter application.

