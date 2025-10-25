# Flutter Build Scripts

This folder contains batch scripts to automate Flutter operations for this
multi-module project.

## Available Scripts

### Release Build Scripts

#### `build_apk_release.bat`
**Build APK Release**
- Runs `flutter clean` in root, data, and domain directories
- Runs `dart run build_runner build --delete-conflicting-outputs` in data and
  domain directories
- Builds APK release (`flutter build apk --release`)

#### `build_bundle_release.bat`
**Build Bundle Release**
- Runs `flutter clean` in root, data, and domain directories
- Runs `dart run build_runner build --delete-conflicting-outputs` in data and
  domain directories
- Builds Bundle release (`flutter build appbundle --release`)

### Utility Scripts

#### `clean_all.bat`

**Clean all directories**

- Runs `flutter clean` in root, data, and domain directories

#### `pub_get_all.bat`

**Get dependencies for all modules**

- Runs `flutter pub get` in root, data, and domain directories

#### `build_runner_all.bat`

**Run code generation**

- Runs `dart run build_runner build --delete-conflicting-outputs` in data and
  domain directories

## Usage

### For Release Builds:

1. **For APK release**: Double-click `build_apk_release.bat` or run it from
   command line
2. **For Bundle release**: Double-click `build_bundle_release.bat` or run it
   from command line

### For Individual Operations:

1. **Clean only**: Run `clean_all.bat`
2. **Dependencies only**: Run `pub_get_all.bat`
3. **Code generation only**: Run `build_runner_all.bat`

## Output Locations

After successful build:
- **APK**: `build\app\outputs\flutter-apk\app-release.apk`
- **Bundle**: `build\app\outputs\bundle\release\app-release.aab`

## Features

- ✅ Error handling with proper error display (script won't close on errors)
- ✅ Step-by-step progress indication with clear separators
- ✅ Automatic directory navigation
- ✅ Success/failure reporting
- ✅ Clean output on success, detailed error information on failure
- ✅ Pubspec.yaml validation before operations
- ✅ No pub get needed (build_runner handles dependencies)

## Requirements

- Flutter SDK installed and in PATH
- Dart SDK (usually comes with Flutter)
- All necessary dependencies defined in respective `pubspec.yaml` files
- `build_runner` configured in data and domain modules (for build_runner
  operations)

## Notes

- **Release build scripts** perform complete workflows (clean + build_runner +
  build)
- **Utility scripts** perform single operations for flexibility
- Build runner automatically handles `pub get` operations when needed
- Scripts will pause on errors to allow you to read error messages before
  closing
- All scripts include pubspec.yaml validation to prevent errors