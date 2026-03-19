<p align="center">
  <img src="https://imgur.com/OjLoHTE.png" width="380">
</p>

<div align="center">

### A SwiftUI quotes browsing app powered by the Quotable API — built as a practical guide to MVVM networking in SwiftUI

[![Stars](https://img.shields.io/github/stars/dheerajghub/Quotes-App?style=for-the-badge&color=FA7343)](https://github.com/dheerajghub/Quotes-App/stargazers)
[![Forks](https://img.shields.io/github/forks/dheerajghub/Quotes-App?style=for-the-badge&color=0D96F6)](https://github.com/dheerajghub/Quotes-App/network/members)
[![Platform](https://img.shields.io/badge/platform-iOS-orange?style=for-the-badge)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0D96F6?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)

</div>

---

## About

Quotes App is a fully functional iOS app that lets users browse, search, and discover quotes fetched live from the [Quotable API](https://github.com/lukePeavey/quotable). Built entirely in SwiftUI, this project is designed as a hands-on reference for intermediate iOS developers looking to understand how real-world apps handle networking, state management, and reactive UI patterns.

The entire build journey is documented on [Instagram](https://www.instagram.com/dheeraj.iosdev) — broken into parts that walk through building the app from scratch.

---

## Motivation

This project exists to answer a question that trips up most SwiftUI beginners: **how do you wire a real API to a real UI without things falling apart?**

It's a practical reference for:
- Structuring networking with the MVVM pattern in SwiftUI
- Using `@ObservedObject`, `@Published`, and `@StateObject` correctly (and understanding the difference)
- Handling loading, success, and error states cleanly
- Building a production-quality SwiftUI app end-to-end

> **Target audience:** Intermediate iOS developers who know SwiftUI basics and want to level up with real networking patterns.

---

## Tech Stack

| Layer | Technology |
|:---|:---|
| Language | Swift 5.7+ |
| UI Framework | SwiftUI |
| Architecture | MVVM |
| Networking | URLSession + async/await |
| Data | [Quotable Free API](https://github.com/lukePeavey/quotable) |
| Dependency Manager | CocoaPods |
| Build Tool | Xcode 14+ |

---

## Key Concepts Covered

**MVVM Architecture** — ViewModels own the networking and state logic; Views stay declarative and dumb. A clean separation that scales well.

**`@StateObject` vs `@ObservedObject`** — when to own a ViewModel vs reference one. This project demonstrates both in context so the distinction is obvious in practice.

**`@Published` + `ObservableObject`** — driving UI updates reactively from network responses without manual `DispatchQueue.main` wrangling.

**REST Networking in SwiftUI** — fetching, decoding, and propagating `Codable` JSON responses from the Quotable API into live SwiftUI views.

**Loading & Error States** — handling the full request lifecycle (loading spinner → success → error) in a reusable, composable way.

---

## Repository Structure

```
Quotes-App/
│
├── Quotes.xcworkspace              ← Open this in Xcode (CocoaPods workspace)
├── Quotes.xcodeproj/               ← Xcode project file
│
├── Quotes/                         ← Main source directory
│   ├── App/
│   │   └── QuotesApp.swift         ← App entry point
│   │
│   ├── Views/                      ← SwiftUI screens & components
│   │   ├── HomeView.swift
│   │   ├── QuoteCardView.swift
│   │   └── ...
│   │
│   ├── ViewModels/                 ← ObservableObject ViewModels
│   │   └── QuotesViewModel.swift
│   │
│   ├── Models/                     ← Codable data models
│   │   └── Quote.swift
│   │
│   ├── Networking/                 ← API service layer
│   │   └── QuotesService.swift
│   │
│   └── Resources/
│       └── Assets.xcassets
│
├── Podfile                         ← CocoaPods dependency file
├── Podfile.lock
├── .gitignore
└── README.md
```

> **Note:** The inner source structure above reflects standard SwiftUI MVVM conventions. Explore the [`Quotes/`](https://github.com/dheerajghub/Quotes-App/tree/main/Quotes) directory on GitHub for the exact file layout.

---

## Getting Started

### Requirements
- Xcode 14+
- iOS 15+ deployment target
- CocoaPods installed (`sudo gem install cocoapods`)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/dheerajghub/Quotes-App.git
cd Quotes-App

# 2. Install CocoaPods dependencies
pod install

# 3. Open the workspace (not the .xcodeproj)
open Quotes.xcworkspace
```

4. Select a simulator or connected device
5. Hit **Cmd + R** to build and run

> ⚠️ Make sure to open `Quotes.xcworkspace` — not `Quotes.xcodeproj` — after running `pod install`.

---

## Screenshots

| | |
|:---:|:---:|
| <img src="https://imgur.com/ueOMQie.png" height="420"> | <img src="https://imgur.com/Zw5rjLD.png" height="420"> |
| <img src="https://imgur.com/VAne7Al.png" height="420"> | <img src="https://imgur.com/OZ7hPb5.png" height="420"> |
| <img src="https://imgur.com/HbLfIku.png" height="420"> | <img src="https://imgur.com/lPFpZ60.png" height="420"> |
| <img src="https://imgur.com/XwP9Hta.png" height="420"> | <img src="https://imgur.com/akAkZIB.png" height="420"> |
| <img src="https://imgur.com/OeokM0U.png" height="420"> | <img src="https://imgur.com/O8g35Xd.png" height="420"> |
| <img src="https://imgur.com/MilmPlZ.png" height="420"> | <img src="https://imgur.com/jGG1CQF.png" height="420"> |
| <img src="https://imgur.com/2aLx2nw.png" height="420"> | <img src="https://imgur.com/kd6CUnx.png" height="420"> |
| <img src="https://imgur.com/Wh03JOJ.png" height="420"> | <img src="https://imgur.com/R3Mf8Sk.png" height="420"> |

---

## Further Reading

- [All SwiftUI property wrappers explained — Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/all-swiftui-property-wrappers-explained-and-compared)
- [Quotable API Documentation](https://github.com/lukePeavey/quotable)

---

## Support

If this project helped you understand SwiftUI networking, a ⭐️ means a lot!

For questions or issues, reach out at **dheerajsh123456@gmail.com**

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-%23FFDD00.svg?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/dheeraj.iosdev)

---

<div align="center">
  <sub>© Dheeraj Kumar Sharma · 2026</sub>
</div>
