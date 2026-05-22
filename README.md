# BookBuddy

BookBuddy is a Flutter mobile application that allows users to browse books using the Google Books API. The app is built using Clean Architecture and Riverpod state management with support for pagination, pull-to-refresh, app flavors, and local favorites storage using Hive.

Features Explane:

 Google Books API Integration
- Fetch books from Google Books API
- Display:
  - Book title
  - Author name
  - Book cover image

 Pagination
- Infinite scroll pagination
- Load more books when reaching bottom
- Pagination limit: 10 items per request

Favorites Feature
- Add/remove favorite books
- Local storage using Hive
- Hive box: ‘favourite_books’

Stored values:
- `id`
- `isFavorite`

 Book Details Screen
Displays:
- Book title
- Author name
- Published date
- Book description

 Pull To Refresh
- Refresh book list using swipe down gesture- Refresh Indicator

Error Handling
- API error handling
- Timeout handling
- Network error handling
- "Try Again" button added

 Empty State Handling
- Empty data UI :”No Books Found”
- Retry button support

App Flavors
- Development flavor
- Production flavor

Clean Architecture
Organized and scalable project structure

State Management
Implemented using Riverpod

 Google Cloud Setup

1. Open Google Cloud Console

Browse: https://console.cloud.google.com

 2. Create Project
- Create a new project

3. Enable Google Books API
Enable: Books API

4. Generate API Key
- Create credentials
- Generate API key
- Add key inside project configuration



 Flutter Project Setup

1. Create Flutter Project
 2. Connect GitHub Repository
 3. Install Dependencies


Tech Stack
- Flutter
- Dart
- Riverpod
- Dio
- Hive
- Google Books API


 Project Structure

lib/
│
├── core/
│   ├── network/
│   │   ├── api_client.dart
│   │   ├── response_handler.dart
│   │   └── error_handler.dart
│   │
│   ├── resources/
│   │   ├── color_manager.dart
│   │   ├── icon_manager.dart
│   │   └── constants.dart
│   │
│   └── routes/
│       └── route_generator.dart
│
├── data/
│   ├── models/
│   ├── repository/
│   └── sources/
│       └── remote/
│           └── book_api_services.dart
│
├── presentation/
│   ├── books/
│   │   ├── views/
│   │   │   ├── book_list_screen.dart
│   │   │   └── book_details_screen.dart
│   │   │
│   │   ├── widgets/
│   │   │
│   │   └── viewmodel/
│   │       └── book_list_provider.dart
│
├── app_config.dart
├── main_dev.dart
├── main_prod.dart
└── main.dart
```

The project follows a clean and modular architecture for scalability and maintainability.



 State Management

This project uses Riverpod for state management.

Why Riverpod?

- Better dependency injection
- Compile-time safety
- Easy testing
- Scalable architecture
- Improved performance

 Riverpod Handles

- API state management
- Pagination state
- Loading state
- Error state
- Pull-to-refresh
- Favorites state



 API Integration

Books are fetched from the Google Books API.

 API Endpoint: 
https://www.googleapis.com/books/v1/volumes

 Features Implemented

- Pagination using `startIndex`
- Pull-to-refresh
- Error handling
- Loading indicators


 Flavor Setup:

This project contains 2 flavors.

1.  Development environment 
2.  Production environment 


 Run Dev Flavor: flutter run --flavor dev -t lib/main_dev.dart
 Run Prod Flavor:  flutter run --flavor prod -t lib/main_prod.dart


Demo Video:  https://your-demo-link.com


