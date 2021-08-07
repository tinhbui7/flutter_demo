# the_coffee_house

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

#Build file Release
- Run cmd: flutter run --release -t lib/app/main.dart
 
#Generate keys of easy_localization
- Run cmd: flutter pub run easy_localization:generate -f keys --source-dir=assets/translations -o locale_keys.g.dart

#Run build to generate JSON mapping files:
- Run cmd:  flutter pub run build_runner build

#Watch entities to generate JSON mapping files:
- Run cmd: flutter pub run build_runner watch

#When things seem to go wrong
- Add after command line cmd: --delete-conflicting-outputs