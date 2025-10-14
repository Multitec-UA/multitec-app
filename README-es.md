[![Developer LinkedIn | David González](https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white&labelColor=555555)](https://linkedin.com/in/davidgonzaleziniguez)




[dev-linkedin-badge]: https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white
[dev-linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez

[Read in English](README.md)

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


Desarrollada en Flutter con **BLoC** y **Clean Architecture**, integrada con **Firebase Auth**, **Cloud Firestore** y **Sembast**.

Multitec App ofrece a los miembros de Multitec UA una forma sencilla de seguir las actividades de la asociación: consultar la agenda de eventos, gestionar su participación y acceder al perfil de socio en cualquier momento, incluso sin conexión.

<br/> 

[🎥 Vista previa](#vista-previa) • [🚀 Funcionalidades](#funcionalidades) • [🏛️ Arquitectura](#arquitectura) • [🧩 Dependencias](#dependencias) • [🗺️ Roadmap](#roadmap) • [🚶‍➡️ Getting Started](#getting-started) • [📫 Contacto](#contacto)

---
<h2 id="vista-previa">🎥 Vista previa</h2>
<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Login</th>
      <th text-align:center;">Inicio</th>
      <th text-align:center;">Agenda</th>
    </tr>
    <tr>
      <td align="center">
        <img width="240" alt="login" src="https://github.com/user-attachments/assets/b64c16e5-cdbb-4e63-9522-4d1d5a4f73a0" />
      </td>
      <td align="center">
        <img width="240" alt="profile" src="https://github.com/user-attachments/assets/b84f37a1-19da-4a6b-90d2-7a8d3c0a41f3" />
      </td>
      <td align="center">
        <img width="240" alt="settings" src="https://github.com/user-attachments/assets/7f363e95-1d12-4529-8bd3-4cbd686da5c7" />
      </td>
    </tr>
  </table>
</div>

<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Detalle de Evento/Actividad</th>
      <th text-align:center;">Perfil</th>
      <th text-align:center;">Ajustes</th>
    </tr>
    <tr>
      <td align="center">
        <img width="240" alt="login" src="https://github.com/user-attachments/assets/b64c16e5-cdbb-4e63-9522-4d1d5a4f73a0" />
      </td>
      <td align="center">
        <img width="240" alt="profile" src="https://github.com/user-attachments/assets/b84f37a1-19da-4a6b-90d2-7a8d3c0a41f3" />
      </td>
      <td align="center">
        <img width="240" alt="settings" src="https://github.com/user-attachments/assets/7f363e95-1d12-4529-8bd3-4cbd686da5c7" />
      </td>
    </tr>
  </table>
</div>

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

**Gestión de estados**
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

<h2 id="getting-started">🚶‍➡️ Getting Started</h2>

### Descarga e instalación del proyecto 🧑‍💻

Clona el repositorio del proyecto (elige una opción):

```sh
# Usando SSH
git clone git@github.com:Multitec-UA/multitec-app.git
```

or

```sh
# Usando HTTPS
git clone https://github.com/Multitec-UA/multitec-app.git
```

Luego, navega hasta la carpeta del proyecto:

```sh
cd multitec-app
```

Instala FVM (Flutter Version Management) de forma global para gestionar fácilmente las versiones del SDK de Flutter:

```sh
dart pub global activate fvm
```

Usa FVM para instalar la versión de Flutter especificada en el archivo .fvmrc (esto instala Flutter localmente para el proyecto):

```sh
fvm install
```

> ⚠️ Después de ejecutar fvm install, puede ser necesario reiniciar VSCode o al menos su terminal para que los cambios surtan efecto y se use correctamente la versión de Flutter instalada con FVM.

### Descarga e instalación de dependencias ✨

Obtén todos los paquetes del proyecto:

```sh
fvm flutter pub get
```

Finalmente, instala los git hooks de Husky:

```sh
fvm dart run husky install
```

### Uso de bricks con Mason 🧱

Este proyecto utiliza [Mason](https://pub.dev/packages/mason_cli) para generar carpetas de features dentro de `lib/features` siguiendo la estructura estándar.

Instala la CLI de Mason:

```sh
dart pub global activate mason_cli
```

Para generar una nueva feature, ejecuta:
```sh
mason make feature
```

---

<h2 id="contacto">📫 Contacto</h2>

<div align="center">

👨‍💻 **Desarrollado por [David González Íñiguez](https://linkedin.com/in/davidgonzaleziniguez)**  

📧 [davidgab08@gmail.com](mailto:davidgab08@gmail.com)  
🔗 [linkedin.com/in/davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)

<br/>

⭐️ Si te ha gustado el proyecto, ¡considera dejar una estrella!  
💬 Abierto a colaboraciones y oportunidades relacionadas con Flutter.

</div>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
