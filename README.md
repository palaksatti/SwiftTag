# 📍 SwiftTag

An **AirTag-inspired Bluetooth tracker** built with **SwiftUI**, following **MVVM**, **Repository Pattern**, and **SwiftData**. SwiftTag demonstrates how to architect a modern iOS application while simulating Bluetooth Low Energy (BLE) device discovery using a mock service.

> ⚠️ This project currently uses a **Mock BLE Scanner** for development and demonstration purposes. The architecture is designed so that the mock implementation can be replaced with **CoreBluetooth** with minimal changes.

---

## 📱 Screenshots

| Home | Scanner |
|------|----------|
| ![](Screenshots/home.png) | ![](Screenshots/scanner.png) |

| Detail | Rename |
|--------|---------|
| ![](Screenshots/detail.png) | ![](Screenshots/rename.png) |

---

# ✨ Features

- 📡 Discover nearby Bluetooth Low Energy (BLE) peripherals using **CoreBluetooth**
- 🧪 Mock BLE scanner for development and UI testing
- 📱 Scan, connect, and disconnect Bluetooth devices
- 🏷️ Rename tracked devices
- 🔋 Display battery level (simulated for unsupported devices)
- 📶 Monitor signal strength (RSSI)
- 💾 Save discovered devices locally using **SwiftData**
- 🗑️ Delete saved trackers
- 🎨 Modern SwiftUI interface
- ⚡ Async/Await powered asynchronous operations
- 🧩 Modular MVVM architecture
- 🔄 Repository Pattern for clean separation of concerns

---

# 🏗️ Architecture

SwiftTag follows the **MVVM (Model-View-ViewModel)** architecture combined with the **Repository Pattern** to keep the UI independent from Bluetooth and persistence layers.

```
┌──────────────┐
│    Views     │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ ViewModels   │
└──────┬───────┘
       │
       ▼
┌──────────────┐
│ Repository   │
└──────┬───────┘
       │
 ┌─────┴───────────────┐
 │                     │
 ▼                     ▼
CoreBluetooth     Mock BLE Service
       │
       ▼
   SwiftData
```

### View

Responsible for rendering the UI and handling user interactions.

### ViewModel

Contains presentation logic, manages application state, and exposes data to the UI using Swift's Observation framework.

### Repository

Acts as the single source of truth by abstracting Bluetooth operations and local persistence.

### CoreBluetooth Service

Discovers and communicates with real Bluetooth Low Energy peripherals using Apple's **CoreBluetooth** framework.

### Mock BLE Service

Simulates nearby BLE devices, making it possible to develop and test the application without requiring physical Bluetooth hardware.

### SwiftData

Persists discovered devices locally so trackers remain available across app launches.

---

# 🚀 Tech Stack

- Swift
- SwiftUI
- CoreBluetooth
- SwiftData
- MVVM Architecture
- Repository Pattern
- Observation Framework
- Async/Await
- NavigationStack

---

# 🤔 Why Both Real & Mock BLE?

Developing Bluetooth applications isn't always convenient because physical BLE peripherals may not be available during development or testing.

SwiftTag solves this by abstracting Bluetooth functionality behind a repository and providing two interchangeable implementations:

- **CoreBluetooth Service** for discovering and interacting with real BLE peripherals.
- **Mock BLE Service** for generating sample devices during development.

Because both implementations share the same interface, the rest of the application remains unchanged regardless of which scanner is being used. This keeps the codebase clean, modular, and highly testable.

---

# 📂 Project Structure

```
SwiftTag
│
├── Models
├── Views
├── ViewModels
├── Repository
├── Services
│   ├── CoreBluetooth
│   └── MockBLE
├── Persistence
├── Utilities
└── Resources
```

---

# 🔮 Future Improvements

- Background Bluetooth scanning
- Automatic reconnection to known peripherals
- Device categories and favorites
- Device location history
- Cloud synchronization
- Find My–style precision finding
- Unit Tests
- UI Tests

---

# 👩‍💻 Author

**Palak Satti**

**iOS Developer**

- Swift
- SwiftUI
- UIKit
- CoreBluetooth
- MVVM
- IoT Applications

---

# ⭐ Support

If you found this project useful or interesting, consider giving it a ⭐ on GitHub.

Contributions, suggestions, and feedback are always welcome!
