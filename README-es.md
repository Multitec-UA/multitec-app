# Multitec App

<!-- ![coverage][coverage_badge] -->

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A Very Good Project created with [Very Good CLI][very_good_cli_link]. Built under [BloC](https://bloclibrary.dev/architecture/) architecture.  
<br>

<p align="center">
<a href="https://bloclibrary.dev/#/architecture"><img src="https://bloclibrary.dev/_astro/bloc_architecture_full.CYn-T9Ox_emLFv.webp" alt="Bloc Architecture"></a>
</p>

---

## Flutter Installation & Configuration 👾

For setting up flutter we recommend following this guide: [very-good-flutter-setup](https://verygood.ventures/blog/very-good-flutter-setup).

### Downloading and installing project 🧑‍💻

Clone the project repository (choose one):

```sh
# Using SSH
git clone git@github.com:Multitec-UA/multitec-app.git
```

or

```sh
# Using HTTPS
git clone https://github.com/Multitec-UA/multitec-app.git
```

Then, navigate into the project folder:

```sh
cd multitec-app
```

Install **FVM** (Flutter Version Management) globally to manage Flutter SDK versions easily:

```sh
dart pub global activate fvm
```

Use FVM to install the Flutter version specified in the `.fvmrc` file (this installs Flutter locally to the project):

```sh
fvm install
```

> ⚠️ After running `fvm install`, it is likely necessary to restart VSCode or at least its terminal for the changes to take effect and for VSCode to use the FVM-installed Flutter version properly.

### Downloading and installing project dependencies ✨

Fetch all packages:

```sh
fvm flutter pub get
```

Finally, install Husky git hooks:

```sh
fvm dart run husky install
```

### Using Mason bricks 🧱

This project uses [Mason](https://pub.dev/packages/mason_cli) to generate feature folders inside `lib/features` following the standard structure.

Install Mason CLI:

```sh
dart pub global activate mason_cli
```

To generate a new feature, run:
```sh
mason make feature
```

### Setup environments and secrets

Create the **environment** folder in the project root and define 3 files inside of it corresponding to the 3 different flavours (you can find and download the files in the link below).

Also before testing in Android define a **secrets.properties** file inside the android directory.

```
multitec-app
|-- android/
  |-- secrets.properties
|-- environment/
  |-- development_key.json
  |-- production_key.json
  |-- staging_key.json
|-- lib/
...
```

> ⚠️ Signing keys are required for certain APIs to work (Ask project maintainers).

[Download files](https://drive.proton.me/urls/CM6Y693B80#0xMaToSrri7C)
_\*Remember to replace VALID_API_KEY_HERE with your google maps api key in the all files._

#### development_key.json file

```json
{
  "SQUARE1_URL": "http://connect-demo.mobile1.io/square1/connect/v1",
  "GOOGLE_MAPS_URL": "https://maps.googleapis.com/maps/api",
  "GOOGLE_MAPS_API_KEY": "VALID_API_KEY_HERE"
}
```

#### secrets.properties file

```properties
MAPS_API_KEY=VALID_API_KEY_HERE

```

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define-from-file environment/development_key.json

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --dart-define-from-file environment/staging_key.json

# Production
$ flutter run --flavor production --target lib/main_production.dart --dart-define-from-file environment/production_key.json
```

_\*Multitec App works on iOS and Android._

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
