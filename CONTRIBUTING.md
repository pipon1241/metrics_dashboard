# Contributing to Metrics Dashboard

Thank you for considering contributing to Metrics Dashboard! This document provides guidelines and instructions for contributing to this Flutter project.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## 📜 Code of Conduct

This project follows a Code of Conduct to ensure a welcoming and inclusive environment:

- **Be respectful**: Treat everyone with respect and kindness
- **Be collaborative**: Work together and help each other
- **Be professional**: Keep discussions constructive and on-topic
- **Be inclusive**: Welcome contributors of all backgrounds and experience levels

## 🚀 Getting Started

### Prerequisites

Before you start contributing, ensure you have:

- **Flutter SDK** >= 3.9.2
- **Dart SDK** >= 3.9.2
- **Git** for version control
- **Android Studio** or **VS Code** with Flutter extensions
- A code editor with Dart/Flutter support

### Fork and Clone

1. **Fork the repository** on GitHub
2. **Clone your fork locally:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/metrics_dashboard.git
   cd metrics_dashboard
   ```

3. **Add upstream remote:**
   ```bash
   git remote add upstream https://github.com/mohammadfirmansyah/metrics_dashboard.git
   ```

4. **Install dependencies:**
   ```bash
   flutter pub get
   ```

5. **Verify setup:**
   ```bash
   flutter doctor
   ```

6. **Run the app:**
   ```bash
   flutter run -d chrome
   ```

## 🔄 Development Workflow

### Creating a New Feature

1. **Sync with upstream:**
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

2. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes** and test thoroughly

4. **Run code analysis:**
   ```bash
   flutter analyze
   ```

5. **Format your code:**
   ```bash
   dart format .
   ```

6. **Commit your changes** (see commit guidelines below)

7. **Push to your fork:**
   ```bash
   git push origin feature/your-feature-name
   ```

8. **Open a Pull Request** on GitHub

### Testing Your Changes

Before submitting a PR, ensure:

- ✅ Code runs without errors: `flutter run -d chrome`
- ✅ No analyzer warnings: `flutter analyze`
- ✅ Code is properly formatted: `dart format .`
- ✅ All charts display correctly
- ✅ Data fetching completes successfully
- ✅ UI is responsive on different screen sizes
- ✅ No console errors or warnings
- ✅ Tests pass (if applicable): `flutter test`

## 💻 Coding Standards

### General Guidelines

- **Language**: Write code comments in **English**
- **Style**: Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- **Formatting**: Use `dart format` for consistent formatting
- **Line Length**: Keep lines under 80 characters when possible
- **Naming**: Use descriptive, meaningful names following Dart conventions

### Flutter/Dart Best Practices

1. **Widget Structure:**
   ```dart
   // Stateless widgets for static content
   class MyWidget extends StatelessWidget {
     const MyWidget({super.key});
     
     @override
     Widget build(BuildContext context) {
       return Container();
     }
   }
   
   // Stateful widgets for dynamic content
   class MyStatefulWidget extends StatefulWidget {
     const MyStatefulWidget({super.key});
     
     @override
     State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
   }
   
   class _MyStatefulWidgetState extends State<MyStatefulWidget> {
     @override
     Widget build(BuildContext context) {
       return Container();
     }
   }
   ```

2. **State Management:**
   - Use `setState()` for local state updates
   - Keep state as close to where it's used as possible
   - Initialize state variables with appropriate default values

3. **Async Operations:**
   - Always use try-catch blocks for async operations
   - Use `async`/`await` for better readability
   - Handle errors gracefully with fallback data

4. **Const Constructors:**
   - Use `const` constructors whenever possible for better performance
   - Mark widgets as `const` when they don't change

### Comment Style

Write clear, educational comments that explain the "why" and "how":

```dart
// Fetch daily usage metrics from external API
// This data populates the line chart with weekly usage trends
Future<void> fetchDailyUsageMetrics() async {
  try {
    // Send GET request to retrieve usage data
    final response = await http.get(Uri.parse(API_URL));
    
    // Check if request was successful
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      
      // Update state with parsed data
      setState(() {
        dailyUsageData = List<double>.from(data['values']);
      });
    }
  } catch (error) {
    // Log error for debugging - consider showing user-friendly message
    print('Error fetching data: $error');
  }
}
```

## 📝 Commit Message Guidelines

We follow **Conventional Commits** format:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, no logic change)
- **refactor**: Code refactoring
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **chore**: Maintenance tasks
- **build**: Build system changes

### Examples

```bash
feat(charts): add loading indicator for data fetching

- Add CircularProgressIndicator while charts load
- Improve user experience during API calls
- Set loading state in Dashboard widget

fix(pie-chart): correct color assignment for categories

- Use modulo operator for color index
- Prevent index out of range errors
- Ensure consistent colors across reloads
```

## 🔀 Pull Request Process

### Before Submitting

1. ✅ Update documentation if needed
2. ✅ Test your changes thoroughly on multiple platforms
3. ✅ Ensure code follows style guidelines (`flutter analyze`)
4. ✅ Format code properly (`dart format .`)
5. ✅ Write clear commit messages
6. ✅ Sync with latest upstream changes
7. ✅ Add tests for new features (if applicable)

### PR Template

When opening a PR, provide:

1. **Description**: What does this PR do?
2. **Motivation**: Why is this change needed?
3. **Testing**: How was it tested?
4. **Screenshots**: Visual changes (if applicable)
5. **Platform Tested**: Web, Android, iOS, etc.
6. **Checklist**:
   - [ ] Code follows style guidelines
   - [ ] Comments added where necessary
   - [ ] Documentation updated
   - [ ] No analyzer warnings
   - [ ] Tested on web platform
   - [ ] Code is properly formatted
   - [ ] Ready for review

### Review Process

- Maintainers will review your PR within 2-3 days
- Address any requested changes promptly
- Once approved, your PR will be merged
- Your contribution will be acknowledged in CHANGELOG.md

## 🐛 Reporting Bugs

### Before Reporting

- Check if the bug has already been reported in Issues
- Verify the bug exists in the latest version
- Test on multiple platforms if possible
- Gather relevant error messages and logs

### Bug Report Template

```markdown
**Description:**
A clear description of the bug

**To Reproduce:**
1. Run the app with `flutter run -d chrome`
2. Navigate to '...'
3. Click on '...'
4. See error

**Expected Behavior:**
What should happen

**Actual Behavior:**
What actually happens

**Screenshots:**
If applicable, add screenshots

**Environment:**
- Flutter version: [output of `flutter --version`]
- Dart version: [version]
- Platform: [Web/Android/iOS/Windows/macOS/Linux]
- Device: [if mobile/desktop]
- Browser: [if web]

**Error Logs:**
```
Paste relevant error logs here
```

**Additional Context:**
Any other relevant information
```

## 💡 Suggesting Enhancements

We welcome feature suggestions! When proposing enhancements:

1. **Check existing issues** to avoid duplicates
2. **Provide clear description** of the feature
3. **Explain the use case** and benefits
4. **Include mockups** if it's a UI change
5. **Consider implementation** complexity

### Enhancement Template

```markdown
**Feature Request:**
Brief title

**Problem:**
What problem does this solve?

**Solution:**
Proposed solution with implementation details

**Alternatives:**
Other approaches considered

**Benefits:**
How does this improve the project?

**Additional Context:**
Any other relevant information, mockups, or examples
```

## 📊 Chart Library Guidelines

When working with fl_chart:

- Follow the [fl_chart documentation](https://pub.dev/packages/fl_chart)
- Maintain consistent styling across all charts
- Test charts with various data sizes (empty, small, large)
- Ensure responsive behavior on different screen sizes
- Handle edge cases (null data, zero values, etc.)

## 🧪 Testing Guidelines

When adding tests:

- Write widget tests for UI components
- Test edge cases and error scenarios
- Ensure tests are deterministic (no flaky tests)
- Run tests before submitting PR: `flutter test`

Example widget test:
```dart
testWidgets('Dashboard displays all charts', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: Dashboard()));
  
  expect(find.text('Daily App Usage'), findsOneWidget);
  expect(find.text('Weekly App Usage'), findsOneWidget);
  expect(find.text('App Usage by Category'), findsOneWidget);
});
```

## 🙏 Thank You!

Thank you for contributing to Metrics Dashboard! Your efforts help make this project better for everyone.

If you have questions, feel free to:
- Open an issue for discussion
- Contact the maintainer
- Check Flutter documentation

---

Happy Coding! 🚀
