[![Developer LinkedIn | David González](https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white&labelColor=555555)](https://linkedin.com/in/davidgonzaleziniguez)




[dev-linkedin-badge]: https://img.shields.io/badge/Developer%20LinkedIn-David%20Gonz%C3%A1lez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white
[dev-linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez

[Leer en español](README-es.md)

<br/> 

<h1><img src="assets/pngs/multitec_icon.png" alt="Logo" height="35"> Multitec App</h1>

> **Official App of the Multitec UA student community**

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


Built with **Flutter**, following **Clean Architecture** and **BLoC**, integrated with **Firebase Auth**, **Cloud Firestore**, and **Sembast**.

Multitec App gives Multitec UA members a simple way to keep up with the association’s activities: browse the events agenda, join/leave activities, and access your member profile anytime — even offline.

<br/> 

[🎥 App Showcase](#app-showcase) • [🏛️ Architecture ](#architecture) • [🧩 Dependencies](#dependencies) • [🗺️ Roadmap](#roadmap) • [🚀 Getting Started](#getting-started) • [📫 Contact](#contact)

---
<h2 id="app-showcase">🎥 App Showcase</h2>


<div align="center">
  <!-- Scroll horizontal -->
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed; white-space:nowrap;">
      <!-- fija 7 columnas de 245px -->
      <colgroup>
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
      </colgroup>
      <thead>
        <tr>
          <th style="text-align:center;">Profile</th>
          <th style="text-align:center;">My Events</th>
          <th style="text-align:center;">Login</th>
          <th style="text-align:center;">Home</th>
          <th style="text-align:center;">Details</th>
          <th style="text-align:center;">Agenda</th>
          <th style="text-align:center;">Settings</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <!-- Contenedor con ancho fijo; el IMG no lleva style -->
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" width="245" alt="Profile">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" width="245" alt="My Events">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" width="245" alt="Login">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" width="245" alt="Home">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/730c1eec-8beb-4d0a-961d-39d11a30eef9" width="245" alt="Details">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/69475da1-ee51-4b7d-b90f-9927a27335bd" width="245" alt="Agenda">
            </div>
          </td>
          <td align="center">
            <div style="width:245px; display:inline-block;">
              <img src="https://github.com/user-attachments/assets/41f97223-4d76-4cde-a421-8cf369c6d894" width="245" alt="Settings">
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

asdadasd

<div align="center">
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed; min-width:calc(4 * 220px + 3 * 12px);">
      <colgroup>
        <col style="width:220px">
        <col style="width:220px">
        <col style="width:220px">
        <col style="width:220px">
      </colgroup>
      <tr>
        <th style="text-align:center;">Profile</th>
        <th style="text-align:center;">My Events</th>
        <th style="text-align:center;">Login</th>
        <th style="text-align:center;">Home</th>
      </tr>
      <tr>
        <td align="center"><img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" width="220" alt="Profile"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" width="220" alt="My Events"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" width="220" alt="Login"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" width="220" alt="Home"></td>
      </tr>
    </table>
  </div>
</div>



<div align="center">
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed; min-width:1600px;">
      <tr>
        <th style="text-align:center; width:220px;">Profile</th>
        <th style="text-align:center; width:220px;">My Events</th>
        <th style="text-align:center; width:220px;">Login</th>
        <th style="text-align:center; width:220px;">Home</th>
      </tr>
      <tr>
        <td align="center"><img alt="profile"  width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" /></td>
        <td align="center"><img alt="myevents" width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" /></td>
        <td align="center"><img alt="login"    width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" /></td>
        <td align="center"><img alt="home"     width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" /></td>
      </tr>
    </table>
  </div>
</div>

<div align="center">
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed; min-width:1600px;">
      <tr>
        <th style="text-align:center; width:220px;">Details</th>
        <th style="text-align:center; width:220px;">Agenda</th>
        <th style="text-align:center; width:220px;">Settings</th>
      </tr>
      <tr>
        <td align="center"><img alt="details"  width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/730c1eec-8beb-4d0a-961d-39d11a30eef9" /></td>
        <td align="center"><img alt="agenda"   width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/69475da1-ee51-4b7d-b90f-9927a27335bd" /></td>
        <td align="center"><img alt="settings" width="220" style="height:auto; max-width:none;" src="https://github.com/user-attachments/assets/41f97223-4d76-4cde-a421-8cf369c6d894" /></td>
      </tr>
    </table>
  </div>
</div>

<div align="center">
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed; min-width:1750px;">
      <tr>
        <th style="text-align:center;">Profile</th>
        <th style="text-align:center;">My Events</th>
        <th style="text-align:center;">Login</th>
        <th style="text-align:center;">Details</th>
        <th style="text-align:center;">Settings</th>
        <th style="text-align:center;">Agenda</th>
        <th style="text-align:center;">Home</th>
      </tr>
      <tr>
        <td align="center"><img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" width="245" alt="Profile"  style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" width="245" alt="My Events" style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" width="245" alt="Login"     style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/730c1eec-8beb-4d0a-961d-39d11a30eef9" width="245" alt="Details"   style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/41f97223-4d76-4cde-a421-8cf369c6d894" width="245" alt="Settings"  style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/69475da1-ee51-4b7d-b90f-9927a27335bd" width="245" alt="Agenda"    style="display:block; height:auto; max-width:none;"></td>
        <td align="center"><img src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" width="245" alt="Home"      style="display:block; height:auto; max-width:none;"></td>
      </tr>
    </table>
  </div>
</div>

<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Profile</th>
      <th text-align:center;">My Events</th>
      <th text-align:center;">Login</th>
      <th text-align:center;">Details</th>
      <th text-align:center;">Settings</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" width="245" alt="Login, Home & Profile">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" width="245" alt="Movie Details">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/730c1eec-8beb-4d0a-961d-39d11a30eef9" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/69475da1-ee51-4b7d-b90f-9927a27335bd" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/41f97223-4d76-4cde-a421-8cf369c6d894" width="245" alt="Premieres">
      </td>
    </tr>
  </table>
</div>


<div align="center">
  <div style="max-width:100%; overflow-x:auto; -webkit-overflow-scrolling:touch; padding:0 6px;">
    <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
      <colgroup>
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
        <col style="width:245px">
      </colgroup>
      <thead>
        <tr>
          <th style="text-align:center;">Profile</th>
          <th style="text-align:center;">My Events</th>
          <th style="text-align:center;">Login</th>
          <th style="text-align:center;">Home</th>
          <th style="text-align:center;">Details</th>
          <th style="text-align:center;">Agenda</th>
          <th style="text-align:center;">Settings</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td align="center"><img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" width="245" alt="Profile"  style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/a7d5c717-d6e1-432e-8f30-f6ebbe04e874" width="245" alt="My Events" style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/c112799e-056f-47f8-9c42-406955306c41" width="245" alt="Login"    style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/a73685ea-4c39-4ece-ae0e-19eb3818624c" width="245" alt="Home"     style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/730c1eec-8beb-4d0a-961d-39d11a30eef9" width="245" alt="Details"  style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/69475da1-ee51-4b7d-b90f-9927a27335bd" width="245" alt="Agenda"   style="display:block; height:auto; max-width:none;"></td>
          <td align="center"><img src="https://github.com/user-attachments/assets/41f97223-4d76-4cde-a421-8cf369c6d894" width="245" alt="Settings" style="display:block; height:auto; max-width:none;"></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>



<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th text-align:center;">Login, Home & Profile</th>
      <th text-align:center;">Movie Details</th>
      <th text-align:center;">Premieres</th>
      <th text-align:center;">Premieres</th>
      <th text-align:center;">Premieres</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/e5060161-52e6-4b94-b982-a4bc31b99dab" width="245" alt="Login, Home & Profile">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/772567db-5dea-41e6-bff4-912c7d49a264" width="245" alt="Movie Details">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/6577c17f-ddbe-4de5-8198-6fbbc8e3c0c5" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/6577c17f-ddbe-4de5-8198-6fbbc8e3c0c5" width="245" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/6577c17f-ddbe-4de5-8198-6fbbc8e3c0c5" width="245" alt="Premieres">
      </td>
    </tr>
  </table>
</div>


<div align="center">
  <table style="border-collapse:separate; border-spacing:12px 0; table-layout:fixed;">
    <tr>
      <th style="text-align:center;">Profile</th>
      <th style="text-align:center;">My Events</th>
      <th style="text-align:center;">Login</th>
      <th style="text-align:center;">Home</th>
      <th style="text-align:center;">Details</th>
      <th style="text-align:center;">Agenda</th>
      <th style="text-align:center;">Settings</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Login, Home & Profile">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Movie Details">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Premieres">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Premieres">
      </td>
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Premieres">
      </td>
    </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43" width="240" alt="Premieres">
      </td>
    </tr>
  </table>
</div>

![settings](https://github.com/user-attachments/assets/8edc094c-1e42-4712-afcf-05ce24218c43)
![profile](https://github.com/user-attachments/assets/158ed4b4-21c1-4451-a3f6-f7118c2a9cbd)
![myevents](https://github.com/user-attachments/assets/d8fda5ec-66f0-4b45-b021-19bd6210eeea)
![login](https://github.com/user-attachments/assets/9f62ebaa-1ee9-4d84-bd10-ad45ed1c5582)
![home](https://github.com/user-attachments/assets/2e5c2ba8-0b0b-4177-aa99-9ffa46495584)
![details](https://github.com/user-attachments/assets/73971499-4056-4594-85e6-d5053fb6c03b)
![agenda](https://github.com/user-attachments/assets/9c236277-4c63-47aa-84bb-2b8319a2cfe1)


<div align="center" style="overflow-x:auto; width:100%;">
  <table style="
      border-collapse:separate;
      border-spacing:12px 0;
      table-layout:fixed;
      /* suma aprox. = 5*245 + separaciones */
      min-width:1300px;">
    <tr>
      <th style="text-align:center;">Login, Home & Profile</th>
      <th style="text-align:center;">Movie Details</th>
      <th style="text-align:center;">Premieres</th>
      <th style="text-align:center;">Premieres</th>
      <th style="text-align:center;">Premieres</th>
      <th style="text-align:center;">Premieres</th>
      <th style="text-align:center;">Premieres</th>
    </tr>
    <tr>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Login, Home & Profile"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Movie Details"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Premieres"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Premieres"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Premieres"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
      <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Premieres"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
       <td align="center">
        <img src="https://github.com/user-attachments/assets/0bf02009-549a-4c6e-99a2-14185b1558a3" alt="Premieres"
             style="width:245px; height:auto; max-width:none; display:block;">
      </td>
    </tr>
  </table>
</div>




---

<h2 id="architecture">🏛️ Architecture</h2>

🔸 **Clean Architecture** + **BLoC**, **feature-first** approach: clear separation of concerns, low coupling, and high testability.

### Layer structure
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


### Folder tree (summary)
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
<h2 id="dependencies">🧩 Dependencies</h2>

**State management**
- `bloc` + `flutter_bloc`

**Routing**
- `go_router` 

**Persistence**
- `sembast` + `sembast_web` 
- `shared_preferences` 

**Firebase**
- `firebase_core`, `firebase_auth`, `cloud_firestore`

**DI**
- `get_it` 

**Serialization / Modeling**
- `freezed`, `freezed_annotation`, `json_serializable` 

**Networking / Cache**
- `dio`
- `dio_cache_interceptor` + `dio_cache_interceptor_hive_store` 

**Utilities**
- `multiple_result` 
- `event_bus`
- `flutter_localizations` 
- `url_launcher`

**Testing & Code Quality**
- `bloc_test`
- `mockito`
- `very_good_analysis`

**Automation & Productivity**
- `husky`, `commitlint_cli`
- `mason_cli`

---
<h2 id="roadmap">🗺️ Roadmap</h2>

- [ ] NFC member card to access the association’s space
- [ ] Online voting system for board elections
- [ ] Push notifications for announcements and event reminders
- [ ] Chat for long-term activities or events
- [ ] Suggestion box module

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

<h2 id="contact">📫 Contact</h2>

<div align="center">

👨‍💻 **Developed by [David González Íñiguez](https://linkedin.com/in/davidgonzaleziniguez)**  

📧 [davidgab08@gmail.com](mailto:davidgab08@gmail.com)  
🔗 [linkedin.com/in/davidgonzaleziniguez](https://linkedin.com/in/davidgonzaleziniguez)

<br/>

⭐️ If you like this project, consider giving it a star!  
💬 Open to collaborations and Flutter opportunities.

</div>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/davidgonzaleziniguez
