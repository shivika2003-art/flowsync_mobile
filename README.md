# FlowSync Mobile

FlowSync Mobile is a lightweight Flutter app for syncing tasks, notes, and activity across devices in near real-time. It focuses on a clean UX, offline-first data handling, and a simple integration with a REST API so both mobile and web clients stay in sync.

> This repository contains the **mobile client** of FlowSync.

---

## ✨ Features
- User authentication (email / password)
- Task & notes management
- Real-time sync between devices
- Offline caching with queued updates
- Light and dark theme support
- Activity timeline for changes

---

## 🧱 Tech Stack
- **Flutter** & **Dart**
- **State Management:** Provider (can be extended to Riverpod/BLoC)
- **Networking:** Dio
- **Local Cache:** Hive (or sqflite optional)
- **Routing:** go_router
- **Linting:** flutter_lints

---

## 📁 Project Structure
```
lib/
  main.dart
  app/
    router.dart
    theme.dart
  core/
    env.dart
    network/
    storage/
    utils/
  features/
    auth/
    tasks/
    sync/
    activity/
  shared/
    widgets/
assets/
test/
```

---

## 🔧 Setup & Run

### 1. Clone Repository
```bash
git clone https://github.com/shivika2003-art/flowsync_mobile.git
cd flowsync_mobile
flutter pub get
```

### 2. Run the App (with API base URL)
```bash
flutter run \
  --dart-define=API_BASE_URL=https://api.example.com \
  --dart-define=ENV=dev
```

### 3. Android
```bash
flutter run -d android
```

### 4. iOS
```bash
cd ios && pod install && cd ..
flutter run -d ios
```

---

## 🌐 API Requirements (Example)
| Method | Endpoint | Description |
|-------:|----------|-------------|
| POST | `/auth/login` | User login returns token |
| GET | `/me` | Get logged-in user |
| GET | `/tasks` | Fetch tasks |
| POST | `/tasks` | Create task |
| PUT | `/tasks/:id` | Update task |
| DELETE | `/tasks/:id` | Delete task |

Tokens should be stored securely using `flutter_secure_storage`.

---

## 🧪 Tests
```bash
flutter test
```

---

## 🧹 Code Quality
```bash
dart format .
flutter analyze
```

---

## 📸 Screenshots (Add Your Own)
| Home | Task Detail |
|------|-------------|
| ![home](assets/images/home.png) | ![task](assets/images/task.png) |

---

## 🚀 Roadmap
- Push notifications
- Biometric unlock
- Task tagging & filters
- Global search across notes/tasks
- Automatic conflict resolution improvements

---

## 🤝 Contributing
1. Fork repo
2. Create branch: `git checkout -b feature-name`
3. Commit: `git commit -m "feat: new feature"`
4. Push: `git push origin feature-name`
5. Open PR

---

