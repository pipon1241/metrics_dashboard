# 📊 Metrics Dashboard

[![GitHub](https://img.shields.io/badge/GitHub-metrics__dashboard-blue?logo=github)](https://github.com/mohammadfirmansyah/metrics_dashboard)
[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?logo=dart)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern, interactive metrics dashboard built with Flutter and fl_chart library. This application displays real-time data visualization with three types of interactive charts - Line Chart for daily usage, Bar Chart for weekly statistics, and Pie Chart for category distribution.

## 📚 Documentation

- **[Contributing Guide](CONTRIBUTING.md)** - Learn how to contribute to this project
- **[Changelog](CHANGELOG.md)** - Version history and release notes

## ✨ Key Features

- **Line Chart**: Daily app usage metrics with smooth curved lines and gradient fill
- **Bar Chart**: Weekly usage statistics with color-coded bars
- **Pie Chart**: Category distribution with dynamic color assignment
- **Real-time Data Fetching**: HTTP requests to external APIs using the http package
- **Responsive Design**: Scrollable layout that adapts to different screen sizes
- **Error Handling**: Comprehensive try-catch blocks with fallback data
- **Cross-Platform**: Runs on Web, Android, iOS, Windows, macOS, and Linux
- **Material Design**: Clean UI following Flutter's Material Design principles

## 📱 Screenshots

```
┌─────────────────────────────────────┐
│  📊 Metrics Dashboard               │
├─────────────────────────────────────┤
│                                     │
│   Daily App Usage                   │
│   ┌───────────────────────────┐   │
│   │     ╱╲    ╱╲              │   │
│   │    ╱  ╲  ╱  ╲    ╱╲       │   │
│   │   ╱    ╲╱    ╲  ╱  ╲      │   │
│   │  ╱            ╲╱    ╲     │   │
│   └───────────────────────────┘   │
│                                     │
│   Weekly App Usage                  │
│   ┌───────────────────────────┐   │
│   │ ▐█▌ ▐█▌     ▐█▌ ▐█▌ ▐█▌  │   │
│   │ ▐█▌ ▐█▌ ▐█▌ ▐█▌ ▐█▌ ▐█▌  │   │
│   └───────────────────────────┘   │
│                                     │
│   App Usage by Category             │
│   ┌───────────────────────────┐   │
│   │       ╱──────╲             │   │
│   │      │   🎨   │            │   │
│   │       ╲──────╱             │   │
│   └───────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

## 🛠️ Technologies Used

- **Flutter SDK** - ^3.9.2 - UI framework for cross-platform development
- **Dart** - ^3.9.2 - Programming language
- **fl_chart** - 0.69.1 - Beautiful and interactive chart library
- **http** - 1.2.2 - HTTP client for API requests
- **Material Design** - Flutter's built-in design system

## 📂 Project Structure

```
metrics_dashboard/
├── lib/
│   └── main.dart           # Main application with dashboard and charts
├── test/
│   └── widget_test.dart    # Widget tests
├── android/                # Android platform files
├── ios/                    # iOS platform files
├── web/                    # Web platform files
├── linux/                  # Linux platform files
├── macos/                  # macOS platform files
├── windows/                # Windows platform files
├── pubspec.yaml            # Dependencies configuration
├── LICENSE                 # MIT License
├── README.md               # Project documentation
├── CONTRIBUTING.md         # Contribution guidelines
└── CHANGELOG.md            # Version history
```

## 🚀 Setup & Installation

Before you begin, ensure you have the following installed:
- **Flutter SDK** >= 3.9.2
- **Dart SDK** >= 3.9.2
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control

Follow these steps to get your development environment running:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mohammadfirmansyah/metrics_dashboard.git
   cd metrics_dashboard
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify installation:**
   ```bash
   flutter doctor
   ```

## 💻 Usage / How to Run

### Run on Web (Recommended for Quick Testing)

```bash
flutter run -d chrome
```

### Run on Other Platforms

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

### Build for Production

```bash
# Web
flutter build web

# Android APK
flutter build apk

# iOS
flutter build ios

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## 📝 Code Implementation Details

### Main Components

#### 1. MyApp - Root Widget
Entry point of the application that sets up the Material app with theme configuration.

#### 2. Dashboard - Stateful Widget
Main dashboard screen containing all charts and data fetching logic.

```dart
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
```

#### 3. Data Fetching Functions

**fetchDailyUsageMetrics()**: Retrieves daily usage data from API
- Parses JSON response
- Converts values to double for chart rendering
- Implements fallback for empty data

```dart
Future<void> fetchDailyUsageMetrics() async {
  final response = await http.get(Uri.parse(API_URL));
  
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    // Process data and update state
    setState(() {
      dailyUsageData = List<double>.from(data['values']);
    });
  }
}
```

**fetchWeeklyUsageData()**: Fetches weekly statistics
- Extracts data from nested JSON structure
- Filters out invalid values (NaN, Infinity)

**fetchCategoryData()**: Gets category distribution
- Maps category names and values
- Prepares data for pie chart rendering

### Chart Configurations

#### Line Chart (Daily Usage)
- **Features**: Curved lines, gradient fill, interactive touch
- **Data**: Daily usage values with labels
- **Customization**: Blue color scheme, grid display

#### Bar Chart (Weekly Usage)
- **Features**: Vertical bars, value display on hover
- **Data**: Weekly usage statistics
- **Customization**: Green color scheme, bottom labels

#### Pie Chart (Category Distribution)
- **Features**: Interactive sections, color-coded segments
- **Data**: Category names with population values
- **Customization**: Dynamic colors from Flutter's Colors.primaries

## 📖 Learning Outcomes

This project demonstrates Flutter development best practices:

- ✅ **State Management**: Using StatefulWidget and setState for reactive UI
- ✅ **Async Programming**: HTTP requests with async/await patterns
- ✅ **Error Handling**: Try-catch blocks with fallback mechanisms
- ✅ **JSON Parsing**: Decoding and mapping API responses
- ✅ **Chart Integration**: Implementing fl_chart library for data visualization
- ✅ **Responsive Layout**: Using SingleChildScrollView for scrollable content
- ✅ **Cross-Platform Development**: Single codebase for multiple platforms
- ✅ **Material Design**: Following Flutter UI/UX best practices

## 🔧 API Endpoints

The application fetches data from the following endpoints:

1. **Daily Usage**:
   ```
   https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/ZA40HNE2G0l7ZUgnq5VO4Q/dataoveraweek.json
   ```

2. **Weekly Usage**:
   ```
   https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/4vOv2DroCvrpvIqvHjRq3w/weeklydata.json
   ```

3. **Category Data**:
   ```
   https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/Q4E2g7pKaK__9XII3C1GEQ/socialmedia.json
   ```

## 🤝 Contributing

We welcome contributions! Please see our **[Contributing Guide](CONTRIBUTING.md)** for details on how to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'feat: add some amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🐛 Known Issues & Future Enhancements

### Current Limitations
- No offline support (requires internet connection)
- No data caching mechanism
- No loading indicators during data fetch
- No error messages displayed to users

### Planned Features (v1.1.0+)
- [ ] Add loading spinners while fetching data
- [ ] Implement error dialogs for failed API calls
- [ ] Add pull-to-refresh functionality
- [ ] Cache data locally using shared_preferences
- [ ] Add date range filters for charts
- [ ] Dark mode theme support
- [ ] Export chart data as PNG/PDF
- [ ] Add more chart types (scatter, radar, etc.)
- [ ] Real-time data updates with WebSocket
- [ ] User authentication and personalized dashboards

## 📄 License

This project is licensed under the MIT License. See the **[LICENSE](LICENSE)** file for details.

## 👨‍💻 Developer

- **Mohammad Firman Syah**
- **Project Link:** [https://github.com/mohammadfirmansyah/metrics_dashboard](https://github.com/mohammadfirmansyah/metrics_dashboard)

---

**Note**: For production deployment, consider:
- Implementing proper error handling with user-friendly messages
- Adding loading states and progress indicators
- Caching API responses to reduce network calls
- Optimizing chart rendering for large datasets
- Adding unit tests and widget tests for reliability
- Implementing CI/CD pipeline for automated testing

Built with ❤️ using Flutter & Dart
