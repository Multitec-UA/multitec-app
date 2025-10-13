[![LinkedIn][linkedin-shield]][linkedin-url]

[Español](README-es.md)

# 📱 Multitec App — Flutter app para la gestión de comunidad

<div align="center">

<p>
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.32.0-blue?logo=flutter" alt="Flutter"></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart" alt="Dart"></a>
  <a href="https://bloclibrary.dev/#/"><img src="https://img.shields.io/badge/State-BLoC-7f52ff" alt="BLoC"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="License: MIT"></a>
  <a href="https://github.com/Multitec-UA/multitec-app/actions/workflows/main.yaml"><img src="https://github.com/Multitec-UA/multitec-app/actions/workflows/main.yaml/badge.svg" alt="CI"></a>
  <a href="https://github.com/Multitec-UA/multitec-app/stargazers"><img src="https://img.shields.io/github/stars/Multitec-UA/multitec-app.svg" alt="GitHub stars"></a>
  <a href="https://github.com/Multitec-UA/multitec-app/issues"><img src="https://img.shields.io/github/issues/Multitec-UA/multitec-app.svg" alt="GitHub issues"></a>
</p>

<p>
  <img src="https://img.shields.io/badge/platforms-Android_iOS_Web-informational" />
</p>

</div>

**TL;DR**
Aplicación Flutter (BLoC + Clean Architecture) para la asociación de estudiantes **Multitec**. Incluye **autenticación con Google**, **agenda de eventos/actividades** con *join/unjoin*, **perfil de usuario**, **i18n** (es/en), *theming* claro/oscuro, **caché offline** y soporte **Android • iOS • Web**.

[🎥 Demo](#-vista-previa) • [✨ Features](#-funcionalidades-clave) • [🧱 Arquitectura](#-arquitectura) • [🛠️ Setup](#-instalación-y-ejecución) • [🧪 Calidad](#-calidad-y-cicd) • [🧭 Para recruiters](#-para-recruiters-pistas-rápidas) • [📫 Contacto](#-contacto)

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

## ✨ Funcionalidades clave

* **Agenda de eventos/actividades** con paginación, filtros por tipo y vista carrusel.
* **Unirse/Salir** con sincronización en tiempo real (Firestore) y conteo de asistentes.
* **Autenticación Google** (Firebase Auth). *Opcional*: restricción de dominio `@multitecua.com` con mensajes localizados.
* **Perfil de usuario** (nombre, email, foto) con estado global vía BLoC/Cubit.
* **Localización** EN/ES via `gen_l10n` y **tema** claro/oscuro.
* **Web support** con **GoRouter** y *nested navigation*.
* **Capa de red** con `dio`, **caché** (`dio_cache_interceptor` + Hive store) y **Sembast** (`sembast_web` en Web) para persistencia.
* **Observabilidad y resiliencia**: `AppBlocObserver`, *error boundary* en `bootstrap.dart`, *backoff*/timeouts, *guard* centralizado y mapeo de fallos a UI.

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

## 🧩 Decisiones técnicas destacadas

* **Estados inmutables** con `freezed` + exhaustividad en `when/map`.
* **Resultados tipados** con `multiple_result` (evita excepciones como control de flujo).
* **Sembast** como almacén local multiplataforma (`sembast_web` para Web).
* **Dio + cache** con políticas `forceCache`, `hitCacheOnErrorExcept` y `maxStale` (10 días).
* **Errores centralizados** (`ErrorReporter`, `guardAsync`) y *error builder* visible en `bootstrap.dart` en *release*.
* **i18n**: `l10n.yaml` + `app_en.arb` / `app_es.arb` (mensajes de errores y UI).

---

## 🚀 Instalación y ejecución

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

## 🧪 Calidad y CI/CD

* **Lints**: `very_good_analysis` (ver `analysis_options.yaml`).
* **Tests**: unit/widget (`flutter_test`, `bloc_test`, `mockito`).
* **CI**: GitHub Actions usando `very_good_workflows` (analyze + test + build).
  *Tip*: ajusta `min_coverage` y añade *jobs* de *build & release* por flavor.

**Project Stats**

<div align="center">

![Repo size](https://img.shields.io/github/repo-size/Multitec-UA/multitec-app)
![Commit activity](https://img.shields.io/github/commit-activity/m/Multitec-UA/multitec-app)
![Last commit](https://img.shields.io/github/last-commit/Multitec-UA/multitec-app)
![Contributors](https://img.shields.io/github/contributors/Multitec-UA/multitec-app)

</div>

---

## 🔐 Seguridad y resiliencia

* `AuthInterceptor` añade `Bearer <token>` desde `AuthService` (Firebase ID token).
* Cacheo HTTP con **Hive store** y *fallback* ante errores (`hitCacheOnErrorExcept: [401,403]`).
* **Errores localizados** (mensajes ARB: red, permisos, auth, HTTP 4xx/SSL, etc.).
* **Canal nativo** (`MethodChannel`) para pasar API keys de forma segura en *runtime*.

---

## 🌍 Localización y accesibilidad

* **Idiomas**: 🇬🇧 EN, 🇪🇸 ES (`lib/core/l10n/arb`).
* **A11y**: tamaños de toque ≥ 48 px, contraste y *semantics* en componentes clave (verificación con DevTools).

---

## 🧭 Para recruiters (pistas rápidas)

* **Arquitectura**: `lib/core/di/service_locator.dart` y `lib/core/router/` (DI + navegación avanzada).
* **Dominio**: `features/schedule/domain` (entidades, *use cases* y contratos limpios).
* **Presentación**: `features/**/presentation/cubit` (estados inmutables con Freezed).
* **Red**: `core/network/` (clientes por servicio, caché e interceptores).
* **Calidad**: `.github/workflows/main.yaml` (CI), `analysis_options.yaml` (lints), `test/**` (tests base).

> Si te interesa ver decisiones complejas: manejo de cache offline, *guards* y *error mapping* → `core/exceptions/*`, `core/network/*`.

---

## 🗺️ Roadmap

* [ ] Deep links / App Links.
* [ ] Tests de integración (`integration_test`).
* [ ] Analytics + Crash reporting.
* [ ] Modo offline completo para agenda.

---

## 📄 Licencia

MIT — ver [LICENSE](LICENSE).

## 📫 Contacto

Multitec — equipo de desarrollo.
Añade aquí tu contacto personal (LinkedIn / email) si procede.

---

<div align="center">

*¿Te gusta el proyecto?* ¡Una ⭐ ayuda a que más gente lo encuentre!

[⬆ Volver arriba](#-multitec-app--flutter-app-para-la-gestión-de-comunidad)

</div>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
