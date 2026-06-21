# <h2 align="center">Flutter Clean Architecture & Feature-First Engineered 🏗️</h2>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Flutter-June%202026-02569B?logo=flutter&style=for-the-badge" alt="Flutter Version">
  </a>
  <a href="https://pub.dev">
    <img src="https://img.shields.io/badge/Architecture-Clean%20%26%20Feature--First-FF6F00?logo=dart&style=for-the-badge" alt="Architecture Style">
  </a>
  <a href="LICENSE.md">
    <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="MIT License">
  </a>
  <a href="https://github.com/Syf-Almjd">
    <img src="https://img.shields.io/badge/Created%20By-SaifAlmajd-blue?style=for-the-badge&logo=github" alt="Created By">
  </a>
</p>
An enterprise-grade, highly scalable, clean, and modular Flutter application template structured according to modern Clean Architecture and Feature-First principles. Designed to support multiple development teams working in parallel.


---


## 📖 Architectural Blueprint

This repository is designed around two core software engineering ideas:
1. **Feature-First Structure**: All business capabilities are grouped into modular features. Grouping folders by feature makes it easy to scale codebases when adding/editing capabilities.
2. **Clean Architecture inside Features**: Strict division between the presentation, domain, and data layers inside each feature module to isolate external data changes from business and UI layouts.

```text
graph TD
    subgraph Feature Block
        Presentation[Presentation Layer: Widgets / Pages / BLoC / Cubit]
        Domain[Domain Layer: Entities / UseCases / Repositories Abstract]
        Data[Data Layer: Models / Repositories Impl / DataSources]
        
        Presentation --> Domain
        Data --> Domain
    end
    
    app([app/ wiring: router, DI, theme, l10n]) -.-> Feature Block
    core([core/ universal primitives: api_client, exceptions]) -.-> Feature Block
    shared([shared/ reusable UI, db service wrappers]) -.-> Feature Block
```

---

## 📁 Repository Directory Layout

The folder layout isolates system configuration, universal constants, shared components, and business features:

```text
lib/
├── main.dart
│
├── app/                         # App-wide wiring and setup
│   ├── app.dart                 # Root MaterialApp configuration (Reactive Locale builder)
│   ├── bootstrap.dart           # App initialization flow & global BLoC providers
│   ├── di/
│   │   ├── service_locator.dart # Central dependency injection container (GetIt)
│   │   └── setup/               # Startup setup modules (Firebase, Exception hooks, etc.)
│   ├── l10n/
│   │   ├── app_localizations.dart # Core dictionary lookups and BuildContext extension
│   │   ├── locale_cubit.dart    # Reactive language state machine and storage manager
│   │   └── languages/           # Structured translation dictionary maps
│   ├── observers/
│   │   └── app_bloc_observer.dart # System-wide BLoC lifecycle logger
│   ├── theme/
│   │   ├── app_theme.dart       # Theme build initialization
│   │   ├── app_colors.dart      # Design token colors
│   │   ├── app_fonts.dart       # Design typography sizing
│   │   └── app_text_styles.dart # Design typography styles
│   └── router/
│       └── app_router.dart      # GoRouter URL routes configuration
│
├── core/                        # Universal primitives (no features or logic)
│   ├── network/
│   │   ├── api_client.dart      # Global HTTP handler (Dio wrapper)
│   │   └── network_constants.dart
│   ├── constants/
│   │   ├── app_assets.dart      # Static asset paths
│   │   ├── app_constants.dart   # General application parameters
│   │   ├── app_lists.dart       # Global lists config (supported lang names, etc.)
│   │   └── local_constants.dart # LocalStorage keys config
│   ├── enums/
│   │   └── app_enums.dart       # Shared enum types (AppLocale, NotificationsType)
│   ├── extensions/
│   │   └── app_extensions.dart  # Native types convenience extensions
│   └── errors/
│       └── failure.dart         # Pure domain failure classifications
│
├── shared/                      # Truly reusable UI widgets and database services
│   ├── models/                  # App-wide generic models (ImageModel, response envelopes)
│   ├── services/                # Local database wrappers (SharedPreferences, SecureStorage)
│   ├── widgets/                 # Reusable layout templates, custom loaders, custom buttons
│   └── helpers/                 # Independent helper code (maps, webviews, dates)
│       └── navigation/
│           ├── navi_cubit.dart  # Enhanced GoRouter-based navigation state container
│           └── navi_state.dart
│
└── features/                    # Feature modules (Feature-First + Clean Architecture)
    ├── auth/                    # Complete Auth feature example
    │   ├── data/
    │   │   ├── datasources/     # Remote and local credential retrieval sources
    │   │   ├── models/          # Serializable models (JSON parser, Freezed schemas)
    │   │   └── repositories/    # Repo implementations translating raw data models
    │   ├── domain/
    │   │   ├── entities/        # Pure entity definitions (e.g. UserEntity)
    │   │   ├── repositories/    # Interfaces specifying database behavior
    │   │   └── usecases/        # Single-responsibility logic units (Login, User Usecases)
    │   └── presentation/
    │       ├── cubit/           # State controllers (UserAuthPageCubit)
    │       ├── pages/           # Base feature pages (Authentication, Passwords, etc.)
    │       └── widgets/         # Custom feature views (LoginForm, SignupForm)
    ├── splash/                  # Splash animations and initial load UI
    ├── intro/                   # App onboarding screens
    ├── settings/                # User preferences and user profiles
    ├── feedback/                # In-app user issue reporting
    └── notifications/           # Awesome Notifications setup
```

---

## ⚡ Key Enhanced Subsystems

### 1. Dynamic Localization (l10n) Engine
Translations are designed to be reactive, persistent, and easy to consume:
- **`LocaleCubit`**: Governs current `AppLocale` states, automatically saving and loading preferences to/from the device's storage using `SharedPreferences`.
- **Reactive Build Extension**: Added a `BuildContext` extension so you can write:
  ```dart
  Text(context.translate("Verify Email"))
  ```
  This automatically registers the widget to rebuild dynamically when the language changes.
- **Root-level Rebuild**: Wrapped the root `MaterialApp.router` in a `BlocBuilder` responding to `LocaleCubit` changes. When a user switches languages, the entire app UI instantly updates.

### 2. Unified Navigation Controller
Navigation is centralized and managed within the application state:
- **`NaviCubit`**: Centralizes GoRouter paths into descriptive, type-safe actions:
  ```dart
  NaviCubit.get(context).navigateToChangePassword(context, email: "test@example.com", isAnon: true);
  ```
- **Hybrid Popping System**: Refactored `pop` routing to dynamically check if the GoRouter stack can pop (`router.canPop()`), falling back automatically to the standard `Navigator.pop(context)` when dismissing modals, sheets, or dialogs.
- **State Emitted Transitions**: Emits distinct `NaviState` states (e.g., `PagePushed`, `PagePopped`) for easy integration with analytics and navigation logging.

### 3. Dependency Injection (DI)
Managed cleanly using `GetIt` via a service locator setup:
- Configured at `lib/app/di/service_locator.dart` where services, network layers, and feature-specific repositories/use cases are registered.
- Keeps classes mockable and simple to instantiate during testing.

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the Flutter SDK installed. This template is designed for **Flutter SDK (June 2026 update)** and newer.

```shell
flutter --version
```

### Installation

1. **Clone the repository**:
   ```shell
   git clone https://github.com/Syf-Almjd/flutter_clean_coded.git
   cd flutter_clean_coded
   ```

2. **Retrieve package dependencies**:
   ```shell
   flutter pub get
   ```

3. **Generate code assets (Freezed & JSON Serializables)**:
   ```shell
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Launch the application**:
   ```shell
   flutter run
   ```

---

## 🧪 Testing

This project leverages TDD (Test-Driven Development) layout structures. Running the unit and widget tests is straightforward:

```shell
flutter test
```

---

## 🛠️ Main Libraries Used

- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Dependency Locator**: [get_it](https://pub.dev/packages/get_it)
- **Network Handler**: [dio](https://pub.dev/packages/dio)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) & [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- **System Logger**: [talker_flutter](https://pub.dev/packages/talker_flutter)
- **Local Notifications**: [awesome_notifications](https://pub.dev/packages/awesome_notifications)
- **Code Generation**: [freezed](https://pub.dev/packages/freezed) & [build_runner](https://pub.dev/packages/build_runner)

---

## 📝 Changelog

### v2.0.0 — Reorganization & Reactive Core Upgrades
* **Structural Relocation**: Reorganized the repository to adhere to a strict `app/`, `core/`, `shared/`, `features/` modular folder layout.
* **Deleted Legacy Code**: Dissolved the old `lib/src/` folder completely and updated all relative and package import statements.
* **Cleaned Up Dependencies**: Resolved all static analysis compiler issues, leaving **0 static analysis compiler errors**.
* **Locale State Management**: Created the `LocaleCubit` for dynamic locale switching and storage persistence. Enabled standard `BuildContext` extensions for localized lookups.
* **GoRouter Integration**: Re-engineered `NaviCubit` to act as a GoRouter path wrapper, providing type-safe redirects and a hybrid GoRouter/Navigator popping handler.
* **Restored Core Setups**: Configured and modernized standard setups (`firebase_setup`, `config_setup`, `notifications_setup`, `exception_setup`) inside `lib/app/di/setup/`.

---

## 🌻 License

This project is open-source software licensed under the [MIT License](LICENSE.md).

---




<h4 align="center">Support Open Source Development</h4>

<div align="center">

[![Sponsor on GitHub](https://img.shields.io/badge/Sponsor-GitHub-ea4aaa?style=for-the-badge&logo=github)](https://github.com/sponsors/Syf-Almjd)

</div>
<p align="center">
  Created with 💙 by <a href="https://github.com/Syf-Almjd">SaifAlmajd</a>
</p>
