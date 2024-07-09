# Immersive Commerce Flutter App

A Flutter-based e-commerce application for iOS and Android platforms, featuring product listing, user authentication, and favorites functionality.

## Features

- Product listing screen with grid layout
- Product detail screen
- User registration and login screens
- Favorites system with persistent storage
- Mock API integration for product data

## Design Choices

1. Architecture: Implemented a provider-based architecture for efficient state management and separation of concerns.
2. Authentication: Used a token-based authentication system with JWT for secure user sessions.
3. API Integration: Created an ApiService class to handle all API calls, using the http package for network requests.
4. Image Loading: Utilized the cached_network_image package for optimized image loading and caching.
5. UI Components: Developed reusable widgets like ProductCard and FavoriteButton for consistent UI across screens.

## Challenges Faced

1. Mock Authentication: Implementing a secure yet functional mock authentication system for development purposes without a backend.
2. Persistent Favorites: Storing and managing user favorites across sessions without a real database.
3. Error Handling: Implementing comprehensive error handling for various network and user input scenarios.
4. Performance Optimization: Ensuring smooth scrolling and efficient memory usage in the product listing screen with potentially large datasets.

## Setup Instructions

1. Ensure you have Flutter installed on your machine.
2. Clone this repository or download the source code.
3. Run `flutter pub get` in the project root to install dependencies.
4. Connect a device or start an emulator.
5. Run `flutter run` to start the application.

## Dependencies

- provider: ^6.0.5
- http: ^0.13.5
- cached_network_image: ^3.2.3
- shared_preferences: ^2.1.0
- jwt_decoder: ^2.0.1

## Future Improvements

- Implement real API integration
- Add unit and widget tests
- Implement advanced search and filtering options
- Add user profile management
- Integrate push notifications
