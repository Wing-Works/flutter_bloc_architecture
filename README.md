# Flutter Clean Architecture

A Flutter application built using Clean Architecture principles with BLoC state management pattern.

## Architecture

This project follows Clean Architecture with three main layers:

- **Presentation Layer** (`lib/`): UI components, BLoC state management, and dependency injection
- **Domain Layer** (`domain/`): Business logic, entities, and use cases
- **Data Layer** (`data/`): Repository implementations, data sources, and network services

## Key Technologies

- **State Management**: Flutter BLoC
- **Dependency Injection**: GetIt + Injectable
- **Network**: Dio + Retrofit
- **Architecture**: Clean Architecture pattern
- **Responsive Design**: Flutter ScreenUtil

## Project Structure

```
lib/
├── core/           # Core utilities and dependency injection
├── src/
│   ├── home/       # Home feature module
│   └── my_app/     # App configuration
data/               # Data layer module
domain/             # Domain layer module
```

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   cd data && flutter pub get
   cd ../domain && flutter pub get
   cd ..
   ```

2. Generate code:
   ```bash
   flutter packages pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Features

- Clean Architecture implementation
- BLoC pattern for state management
- Modular structure with separate data and domain layers
- Dependency injection setup
- Network layer with Dio and Retrofit