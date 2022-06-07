# EPOKA - Mission Management System

EPOKA is a comprehensive Flutter-based mobile and web application designed for managing business missions, payments, and user validation workflows. The application features a modern multi-platform architecture with a PHP backend and MySQL database.

## 📋 Project Overview

EPOKA is a mission management platform that allows organizations to:
- Manage user authentication and profiles
- Track and validate business missions
- Handle payment processing and reimbursements
- Configure pricing and reimbursement settings
- Support both mobile and web platforms

## 🏗️ Architecture

### Frontend (Flutter)
- **Cross-platform**: Supports Android, iOS, Web, and Windows
- **Material Design**: Modern UI with gradient themes
- **Responsive**: Adaptive layouts for different screen sizes
- **State Management**: Built with Flutter's StatefulWidget system

### Backend (PHP)
- **RESTful API**: PHP scripts handling authentication and data operations
- **Database Integration**: MySQL database connectivity
- **CORS Support**: Cross-origin resource sharing enabled

### Database (MySQL)
- **Relational Structure**: Well-designed schema with proper relationships
- **Core Tables**: Users, Missions, Agencies, Communes, Companies, and Pricing

## 🚀 Features

### Authentication System
- Secure user login with credentials validation
- Session management using SharedPreferences
- Error handling for invalid credentials

### Mission Management
- Create and track business missions
- Mission states: Validation, Payment, Archived
- Detailed mission information including location, dates, and descriptions
- Mission deletion with confirmation dialogs

### Payment Processing
- View missions pending payment
- Update payment status
- Reimbursement calculation system

### User Profile Management
- Display user information and credentials
- Profile data persistence

### Settings & Configuration
- Customizable daily reimbursement rates
- Kilometer-based reimbursement settings
- Distance calculation tools

### Platform-Specific Features
- **Web**: Payment processing, validation, and settings
- **Mobile**: Home dashboard and validation features
- **Responsive UI**: Adapts to different platforms automatically

## 🛠️ Technology Stack

### Frontend
- **Flutter SDK**: >=2.16.1 <3.0.0
- **Dart**: Cross-platform development
- **Key Dependencies**:
  - `http: ^0.13.4` - Network requests
  - `flutter_secure_storage: ^5.0.2` - Secure data storage
  - `shared_preferences: ^2.0.13` - Local preferences storage
  - `rxdart: ^0.27.3` - Reactive programming
  - `ffi: ^1.1.2` - Foreign function interface

### Backend
- **PHP**: Server-side scripting
- **MySQL**: Relational database management
- **PDO**: Database abstraction layer

### Development Tools
- **flutter_lints**: Code quality and best practices
- **flutter_test**: Unit and widget testing framework

## 📁 Project Structure

```
EPOKA/
├── lib/                          # Flutter source code
│   ├── main.dart                 # Application entry point
│   ├── login.dart                # Authentication system
│   ├── routeur.dart              # Navigation router
│   ├── accueil.dart              # Home/dashboard page
│   ├── payment.dart              # Payment management
│   ├── validation.dart           # Mission validation
│   ├── profile.dart              # User profile
│   └── Settings.dart             # Application settings
├── php/                          # Backend API scripts
│   ├── login.php                 # User authentication
│   ├── Payment.php               # Payment data retrieval
│   ├── UpdatePayment.php         # Payment status updates
│   └── Validation.php            # Mission validation data
├── android/                      # Android-specific configuration
├── ios/                          # iOS-specific configuration
├── web/                          # Web-specific configuration
├── windows/                      # Windows-specific configuration
├── epoka.sql                  # Database schema and data
├── pubspec.yaml                  # Flutter dependencies
└── analysis_options.yaml        # Code analysis configuration
```

## 🗄️ Database Schema

The application uses a MySQL database with the following core tables:

### `utilisateur` (Users)
- User authentication and profile information
- Hierarchical structure with supervisor relationships
- Agency associations

### `mission` (Missions)
- Mission details including location, dates, and status
- Links to users and communes
- State management (Validation, Payment, Archived)

### `agence` (Agencies)
- Organizational units
- Location-based agency management

### `commune` (Communes)
- Geographic location data
- Postal codes and coordinates

### `entreprise` (Companies)
- Company information and pricing plans

### `forfait` (Pricing Plans)
- Daily and kilometer-based reimbursement rates

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=2.16.1)
- PHP server environment
- MySQL database
- Web server (Apache/Nginx)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd EPOKA
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Database Setup**
   - Import `epoka.sql` into your MySQL database
   - Update database credentials in PHP files

4. **Backend Configuration**
   - Place PHP files in your web server directory
   - Update the base URL in Flutter code (currently using `http://10.38.171.147/epoka/`)

5. **Run the application**
   ```bash
   # For web
   flutter run -d chrome
   
   # For mobile
   flutter run
   
   # For specific platform
   flutter run -d windows
   ```

### Configuration

Update the server URL in the Flutter code:
```dart
// In login.dart and other API calls
var url = Uri.parse('YOUR_SERVER_URL/epoka/login.php?identifier=$login&mdp=$password');
```

Update database credentials in PHP files:
```php
$host = 'your_host';
$db   = 'epoka';
$user = 'your_username';
$pass = 'your_password';
```

## 🎯 Usage

1. **Login**: Enter credentials on the login screen
2. **Navigation**: Use bottom navigation to switch between features
3. **Mission Management**: View, validate, and manage missions
4. **Payments**: Process payment requests and view pending items
5. **Settings**: Configure reimbursement rates and preferences

## 🌐 Platform Support

- ✅ **Web Browser**: Full feature set
- ✅ **Android**: Mobile-optimized interface
- ✅ **iOS**: Native iOS experience
- ✅ **Windows**: Desktop application
- ✅ **Responsive Design**: Adapts to various screen sizes

## 🔒 Security Features

- Secure credential validation
- Session management
- CORS protection
- SQL injection prevention using PDO prepared statements

