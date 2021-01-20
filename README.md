# flutter_boilerplate

A boilerplate project created in Flutter

## Getting Started

Run the flutter app with the following arguments:

```
flutter run --dart-define=BASE_URL=BASE_URL_VALUE --dart-define=STORAGE_URL=STORAGE_URL_VALUE
```

More about command argument for environment config
[Here](https://itnext.io/flutter-1-17-no-more-flavors-no-more-ios-schemas-command-argument-that-solves-everything-8b145ed4285d)

## Boilerplate Features:
- Home
- Dio
- BLoC
- Secure Storage
- Validation
- Animations

## Folder Structure
```
flutter_boilerplate
├── android
├── assets
│   ├── fonts
│   │   ├── lato
│   │   │   ├── Lato-Bold.ttf
│   │   │   ├── Lato-Italic.ttf
│   │   │   └── Lato-Regular.ttf
│   │   ├── lora
│   │   │   ├── Lora-Bold.ttf
│   │   │   ├── Lora-Italic.ttf
│   │   │   └── Lora-Regular.ttf
│   │   └── roboto
│   │       ├── Roboto-Bold.ttf
│   │       ├── Roboto-Italic.ttf
│   │       └── Roboto-Regular.ttf
│   ├── icons  
│   ├── images 
│   │   ├── placeholder_avatar.png
│   │   └── placeholder_image.png
│   └── lang
├── ios  
├── lib
│   ├── bloc
│   ├── config
│   │   ├── network
│   │   │   ├── dio_client.dart
│   │   │   └── network_exception.dart
│   │   └── environment_config.dart
│   ├── constants
│   │   ├── assets.dart
│   │   ├── dimens.dart
│   │   ├── endpoints.dart
│   │   ├── fonts.dart
│   │   └── strings.dart
│   ├── cubits
│   │   ├── post
│   │   │   ├── post_cubit.dart
│   │   │   └── post_state.dart
│   │   └── user
│   │       ├── user_cubit.dart
│   │       └── user_state.dart
│   ├── models
│   │   ├── post
│   │   │   └── post_model.dart
│   │   └── user
│   │       └── user_model.dart
│   ├── repositories
│   │   ├── post
│   │   │   └── post_repository.dart
│   │   └── user
│   │       └── user_repository.dart
│   ├── screens
│   │   ├── home
│   │   │   ├── home_screen.dart
│   │   │   └── home_detail_screen.dart
│   │   └── user
│   │       └── user_list_screen.dart
│   ├── utils
│   │   ├── dio_error_util.dart
│   │   └── string_util.dart
│   ├── widgets
│   │   └── open_container_wrapper.dart
│   └── main.dart
└── test
```
