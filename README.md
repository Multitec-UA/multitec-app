[![LinkedIn](https://img.shields.io/badge/LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/davidgonzaleziniguez)


[dev-linkedin-badge]: https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white
[dev-linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez

[Leer en español](README-es.md)

<br/> 

<h1><img src="assets/pngs/multitec_icon.png" alt="Logo" height="35"> Multitec App</h1>

> **Aplicación oficial de la comunidad de estudiantes Multitec UA**

<br/> 

<div align="center">
<p>
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.32.4-02569B?logo=flutter&logoColor=white" alt="Flutter"></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.8%2B-0175C2?logo=dart&logoColor=white" alt="Dart"></a>
  <img src="https://img.shields.io/badge/Architecture-Clean%20/ %20Hexagonal-blueviolet" alt="Architecture: Clean/Hexagonal">
  <a href="https://bloclibrary.dev/#/"><img src="https://img.shields.io/badge/State-BLoC-7f52ff" alt="BLoC"></a>
  <img src="https://img.shields.io/badge/Platforms-Android%20%20iOS%20%20Web-5E6C84?labelColor=55555" alt="Platforms: Android · iOS · Web">
</p>
</div>


Desarrollada en Flutter con **BLoC** y **Clean Architecture**, con integración de **Firebase Auth**, **Cloud Firestore** y **Sembast**.

Multitec App ofrece a los miembros de Multitec UA una forma sencilla de seguir las actividades de la asociación: consultar la agenda de eventos, gestionar su participación y acceder al perfil de socio en cualquier momento, incluso sin conexión.

<br/> 

[🎥 Vista previa](#vista-previa) • [🏛️ Arquitectura](#arquitectura) • [🧩 Dependencias](#dependencias) • [🗺️ Roadmap](#roadmap) • [🚀 Getting Started](#getting-started) • [📫 Contacto](#contacto)

---

<h2 id="vista-previa">🎥 Vista previa</h2>

* 🎬 **Overview** (20–30 s): navegación principal + rendimiento percibido.
  `<video src="assets/previews/overview.mp4" controls width="640"></video>`
* 📅 **Agenda / Schedule** — `schedule.gif`
* ➕ **Unirse/Salir de actividad** — `join-unjoin.gif`
* 👤 **Perfil** — `profile.gif`
* ⚙️ **Ajustes (tema/idioma)** — `settings.gif`

---

<h2 id="arquitectura">🏛️ Arquitectura</h2>

🔸**Clean Architecture** + **BLoC**, con enfoque **feature-first** : separación de responsabilidades, bajo acoplamiento y alta testabilidad.

### Estructura por capas
🔹 **Data** — `datasources • dtos • repository implementations`  
🔹 **Domain** — `entities • usecases • repositories`  
🔹 **Presentation** — `cubits • screens • widgets`

```text
feature/
├── data/
│   ├── datasources/
│   ├── dtos/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
└── presentation/
    ├── cubits/
    ├── screens/
    └── widgets/
````


### Árbol de carpetas (resumen)
```text
lib/
  core/
    constants/        # API/base URLs
    database/         # Sembast (IO/Web)
    di/               # Inyección de dependencias (get_it)
    events/           # event bus
    exceptions/       # Failures, excepciones, reporting y guard clauses
    l10n/             # ARB + gen_l10n
    network/          # Dio clients, cache, interceptors
    preferences/      # SharedPreferences
    router/           # GoRouter + nested shell
    ui/               # Design system, theming, componentes reutilizables
    utils/            # Helpers y extensiones comunes

  features/
    auth/
    home/        
    schedule/         
    user/                   
    profile/
    settings/

  bootstrap.dart
  main_development.dart
  main_staging.dart
  main_production.dart
```

---

<h2 id="dependencias">🧩 Dependencias</h2>

**Gestión de estado**
- `bloc` + `flutter_bloc`

**Routing**
- `go_router` 

**Persistencia**
- `sembast` + `sembast_web` 
- `shared_preferences` 

**Firebase**
- `firebase_core`, `firebase_auth`, `cloud_firestore`

**DI**
- `get_it` 

**Serialización / Modelado**
- `freezed`, `freezed_annotation`, `json_serializable` 

**Red / Caché**
- `dio`
- `dio_cache_interceptor` + `dio_cache_interceptor_hive_store` 

**Utilidades**
- `multiple_result` 
- `event_bus`
- `flutter_localizations` 
- `url_launcher`

**Testing & Code Quality**
- `bloc_test`
- `mockito`
- `very_good_analysis`

**Automatización & productividad**
- `husky`, `commitlint_cli`
- `mason_cli`

---

<h2 id="roadmap">🗺️ Roadmap</h2>

- [ ] Integración con tarjeta **NFC** para acceder al local de la asociación
- [ ] Sistema de votación online para elecciones de la junta directiva
- [ ] Notificaciones push para avisos y recordatorios de eventos   
- [ ] Chat interno para actividades o eventos de larga duración 
- [ ] Módulo de buzón de sugerencias 

---


<h2 id="getting-started">🚀 Getting Started</h2>

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

---

<h2 id="contacto">📫 Contacto</h2>

Developer: David González Íñiguez 
- Email: davidgab08@gmail.com
- Linkedin: [davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
