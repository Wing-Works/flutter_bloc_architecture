# Flutter BLoC Architecture

A Flutter application implementing Clean Architecture principles with BLoC state management,
organized in a modular structure.

## Overview

This project demonstrates a scalable Flutter architecture with clear separation of concerns across
three layers:

### Architecture Layers

1. **Presentation Layer** (`lib/`)
    - UI components and widgets
    - BLoC state management
    - Routing and navigation
    - Dependency injection configuration
    - Theming and localization

2. **Domain Layer** (`domain/`)
    - Business entities
    - Use cases (business logic)
    - Repository interfaces
    - Independent of external frameworks

3. **Data Layer** (`data/`)
    - Repository implementations
    - Data sources (Remote & Local)
    - API services with Retrofit
    - Data models and mappers

## Tech Stack

- **State Management**: `flutter_bloc` - Predictable state management
- **Dependency Injection**: `get_it` + `injectable` - Service locator pattern
- **Networking**: `dio` + `retrofit` - Type-safe HTTP client
- **Functional Programming**: `dartz` - Error handling with Either type
- **Responsive UI**: `flutter_screenutil` - Adaptive layouts
- **Fonts**: `google_fonts` - Custom typography
- **Localization**: `flutter_localizations` + `intl` - Multi-language support

## Project Structure

```
flutter_bloc_architecture/
├── lib/                    # Presentation layer
│   ├── core/              # Core utilities
│   │   ├── base/          # Base classes
│   │   ├── constant/      # App constants
│   │   ├── di/            # Dependency injection
│   │   ├── l10n/          # Localization files
│   │   ├── route/         # Navigation routing
│   │   ├── services/      # App services
│   │   ├── theme/         # App theming
│   │   └── util/          # Utilities
│   ├── src/               # Feature modules
│   │   ├── home/          # Home feature
│   │   ├── settings/      # Settings feature
│   │   ├── splash/        # Splash screen
│   │   ├── my_app/        # App configuration
│   │   └── widget/        # Shared widgets
│   └── main.dart          # App entry point
├── data/                  # Data layer module
│   └── lib/               # Data implementations
├── domain/                # Domain layer module
│   └── lib/               # Business logic
├── scripts/               # Build automation scripts
├── assets/                # Images and resources
└── test/                  # Unit tests
```

## Getting Started

### Prerequisites

- Flutter SDK ^3.9.2
- Dart SDK ^3.9.2

### Setup

**Option 1: Using Automation Scripts (Windows)**

```bash
# Install dependencies for all modules
scripts/pub_get_all.bat

# Run code generation
scripts/build_runner_all.bat
```

**Option 2: Manual Setup**

```bash
# Install dependencies
flutter pub get
cd data && flutter pub get
cd ../domain && flutter pub get
cd ..

# Generate code (DI, Retrofit, JSON serialization)
cd data && dart run build_runner build --delete-conflicting-outputs
cd ../domain && dart run build_runner build --delete-conflicting-outputs
cd ..
```

### Run the App

```bash
flutter run
```

### Build Release

**Using Scripts (Windows):**

```bash
# Build APK
scripts/build_apk_release.bat

# Build App Bundle
scripts/build_bundle_release.bat
```

**Manual Build:**

```bash
# APK
flutter build apk --release

# App Bundle
flutter build appbundle --release
```

## Automation Scripts

The `scripts/` folder contains batch files for automated workflows:

- **`pub_get_all.bat`** - Install dependencies for all modules
- **`build_runner_all.bat`** - Run code generation
- **`clean_all.bat`** - Clean all modules
- **`build_apk_release.bat`** - Complete APK build workflow
- **`build_bundle_release.bat`** - Complete App Bundle build workflow

See [scripts/README.md](scripts/README.md) for details.

## Features

Clean Architecture with clear layer separation  
BLoC pattern for reactive state management  
Modular structure for scalability  
Type-safe API calls with code generation  
Functional error handling  
Dependency injection for testability  
Responsive design utilities  
Multi-language support ready  
Build automation scripts

## Development

### Code Generation

Run code generation after modifying:

- Injectable classes (DI)
- Retrofit API definitions
- JSON serializable models

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Clean Build

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

## License

This project is a template/boilerplate for Flutter applications.

