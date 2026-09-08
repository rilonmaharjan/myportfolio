# My Portfolio 🚀

A modern, responsive personal portfolio web application built with **Flutter Web**.

## 📌 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile browsers.
- **About Section**: Introduction, bio, and background details.
- **Skills Section**: Technical skills and proficiency highlights.
- **Experience Section**: Work history and achievements.
- **Projects Section**: Showcasing past and ongoing projects with external links.
- **Contact & Footer**: Easy ways to connect via email and social platforms.

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter Web](https://flutter.dev/) (SDK ^3.7.0)
- **Language**: Dart
- **Key Packages**:
  - `google_fonts`: Custom typography
  - `flutter_svg`: SVG icon rendering
  - `url_launcher`: Opening external links and social channels

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured.
- Chrome or any modern web browser.

### Running Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/rilonmaharjan/myportfolio.git
   cd myportfolio
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run the web application:
   ```bash
   flutter run -d chrome
   ```

---

## 🌐 Deployment to GitHub Pages

> **Note for Future Updates**: Use the following command sequence to build and deploy/update the web build to the `gh-pages` branch.

```bash
# 1. Build the Flutter web project with base-href for repository subpath
flutter build web --base-href "/myportfolio/"

# 2. Force add the build/web directory to git
git add -f build/web

# 3. Commit the new build
git commit -m "Update web build"

# 4. Create a temporary subtree branch for build/web
git subtree split --prefix build/web -b deploy-web

# 5. Push the build to the remote gh-pages branch
git push origin deploy-web:gh-pages --force

# 6. Clean up local temporary branch
git branch -D deploy-web
```
