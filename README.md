[![LinkedIn · David González](https://img.shields.io/badge/-LinkedIn%20·%20David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/davidgonzaleziniguez)



[dev-linkedin-badge]: https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white
[dev-linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez

[Leer en español](README-es.md)

<br/> 

<h1><img src="assets/pngs/multitec_icon.png" alt="Logo" height="35"> Multitec App</h1>

> **Mobile app to help members keep up with events and interact with the community** 


<div align="center">
<p>
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.32+-02569B?logo=flutter&logoColor=white" alt="Flutter"></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart&logoColor=white" alt="Dart"></a>
  <img src="https://img.shields.io/badge/Architecture-Clean%20/ %20Hexagonal-blueviolet" alt="Architecture: Clean/Hexagonal">
  <a href="https://bloclibrary.dev/#/"><img src="https://img.shields.io/badge/State-BLoC-7f52ff" alt="BLoC"></a>
  <img src="https://img.shields.io/badge/Platforms-Android%20%20iOS%20%20Web-5E6C84?labelColor=55555" alt="Platforms: Android · iOS · Web">
</p>
</div>


Aplicación Flutter (BLoC + Clean Architecture) para la asociación de estudiantes **Multitec**.


[🎥 Vista previa](#-vista-previa) • [📖 Qué es Multitec App](#-qué-es-multitec-app) • [🧩 Arquitectura](#-arquitectura) • [🧱 Dependencias](#-dependencias) • [🗺️ Roadmap](#-roadmap) • [🛠️ Setup](#-setup) • [📫 Contacto](#-contacto)

---

## 👀 Vista previa

> Sube 1 MP4 de 20–30 s + 3–6 GIFs breves. Colócalos en `assets/previews/`.

* 🎬 **Overview** (20–30 s): navegación principal + rendimiento percibido.
  `<video src="assets/previews/overview.mp4" controls width="640"></video>`
* 📅 **Agenda / Schedule** — `schedule.gif`
* ➕ **Unirse/Salir de actividad** — `join-unjoin.gif`
* 👤 **Perfil** — `profile.gif`
* ⚙️ **Ajustes (tema/idioma)** — `settings.gif`

**Emojis útiles**: 🎬📅⭐👤⚙️🌙🌍⚡

---

## 📖 Qué es Multitec App
Aplicación Flutter de producción para la asociación de estudiantes Multitec. Incluye autenticación con Google, agenda de eventos/actividades con join/unjoin, perfil de usuario, i18n (es/en), theming claro/oscuro, caché offline y soporte Android • iOS • Web.

---

## 🧱 Arquitectura

* **Clean Architecture + BLoC/Cubit**:
  `presentation (widgets/pages) ↔ application (blocs/cubits) ↔ domain (entities/usecases/repos) ↔ data (dtos/datasources/repo impl)`
* **DI** con `get_it` (`service_locator.dart`).
* **Navegación** con **GoRouter** y `ScaffoldWithNestedNavigation` (tabs/bottom nav con estado preservado).
* **Red**: `NetworkService` con clientes (`MultitecApiClient`, `GoogleMapsApiClient`), interceptores (`AuthInterceptor`, `ApiKeyInterceptor`) y `MethodChannel` para API keys.

**Árbol de carpetas (resumen)**

```text
lib/
  core/
    constants/        # API/base URLs vía --dart-define
    database/         # Sembast (IO/Web)
    di/               # get_it service locator
    events/           # event bus
    exceptions/       # Failure, guard, reporting
    l10n/             # ARB + gen_l10n
    network/          # Dio clients, cache, interceptors
    router/           # GoRouter + nested shell
    ui/               # Design system, theming, componentes
    utils/            # helpers (p.ej. SafeCubit)
  features/
    auth/             # Firebase Auth + Google Sign-In
    schedule/         # Agenda (data/domain/presentation)
    user/             # Perfil y estado de usuario
    settings/         # Tema/Idioma
    home/, profile/, example/
  bootstrap.dart
  main_development.dart
  main_staging.dart
  main_production.dart
```

---

## 🧩 Dependencias
**Principales paquetes** (ver `pubspec.yaml`):

* Estado: `bloc`, `flutter_bloc`
* Routing: `go_router`
* Red/Cache: `dio`, `dio_cache_interceptor`, `dio_cache_interceptor_hive_store`
* Persistencia: `sembast`, `sembast_web`, `shared_preferences`
* Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`
* DI: `get_it`
* Serialización/Modelado: `freezed_annotation`, `json_serializable`
* Utilidades: `multiple_result`, `event_bus`, `flutter_localizations`, `flutter_svg`, `url_launcher`, `device_preview`

**Dev**: `very_good_analysis`, `bloc_test`, `mockito`, `freezed`, `build_runner`, `json_serializable`, `husky`, `commitlint_cli`

---

## 🗺️ Roadmap

* [ ] Deep links / App Links.
* [ ] Tests de integración (`integration_test`).
* [ ] Analytics + Crash reporting.
* [ ] Modo offline completo para agenda.

---


## 🚀 Setup

### Requisitos

* **Flutter** `3.32.0` (FVM en `.fvmrc`).
* **Dart** `3.8+`.
* **Firebase** configurado (`flutterfire configure` o añade `google-services.json` / `GoogleService-Info.plist`).

### 1) Variables de entorno (`--dart-define`)

El proyecto lee *build-time env vars* en `core/constants/environment.dart`:

* `GOOGLE_MAPS_API_KEY` — clave de Maps.
* `GOOGLE_MAPS_URL` — p. ej. `https://maps.googleapis.com/maps/api`.
* `MULTITEC_URL` — backend Multitec.
* `SQUARE1_URL` — servicio adicional.

> Alternativa: `environment/{development,staging,production}_key.json` si inyectas claves por *platform channel*.

### 2) Dependencias y codegen

```bash
# (Opcional) usar FVM
fvm install
fvm flutter pub get

# Codegen (freezed/json)
dart run build_runner build -d
```

### 3) Ejecutar por *flavor*

```bash
# Desarrollo
flutter run --flavor development -t lib/main_development.dart \
  --dart-define=GOOGLE_MAPS_API_KEY=xxxx \
  --dart-define=GOOGLE_MAPS_URL=https://maps.googleapis.com/maps/api \
  --dart-define=MULTITEC_URL=https://api.tu-backend.dev \
  --dart-define=SQUARE1_URL=https://square1.dev

# Staging
flutter run --flavor staging -t lib/main_staging.dart [--dart-define=...]

# Producción
flutter run --flavor production -t lib/main_production.dart [--dart-define=...]
```

> **Android**: `productFlavors { development | staging | production }` en `android/app/build.gradle` (con `applicationIdSuffix` y `manifestPlaceholders`).
> **Web**: `flutter run -d chrome` (ajusta `--web-renderer=html|canvaskit`).

---

## 📫 Contacto

David González Íñiguez 
- Email: davidgab08@gmail.com
- Linkedin: [davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)

---

<div align="center">

*¿Te gusta el proyecto?* ¡Una ⭐ ayuda a que más gente lo encuentre!

[⬆ Volver arriba](#-multitec-app--flutter-app-para-la-gestión-de-comunidad)

</div>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
