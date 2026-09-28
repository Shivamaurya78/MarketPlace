# Marketplace – Online Classified Listing Platform

A full-stack marketplace web application built with **Java, Spring Boot, MySQL, Spring Security, and Thymeleaf**.

The application allows users to register, log in, create product/service listings, browse listings, search listings, filter by city and category, and manage their own listings.

## 🚀 Features

### 👤 User Features

* User registration
* User login/logout
* Secure password encryption using BCrypt
* Role-based authentication
* User profile
* View own listings
* Create listings
* Edit own listings
* Delete own listings

### 📦 Listing Features

Users can create listings with:

* Product / Service type
* Name
* Detail
* Category
* Subcategory
* Country
* State
* City
* Area
* Price

### 🔎 Search & Filtering

* Search listings by name
* Filter listings by city
* Filter listings by category
* Filter listings by city + category
* View individual listing details

### 🛡️ Security & Authorization

* Spring Security based authentication
* BCrypt password hashing
* USER and ADMIN roles
* Listing ownership validation
* Users can manage their own listings
* Admin can manage listings and categories

### 🎨 Frontend

* Responsive marketplace UI
* Homepage with featured/latest listings
* Category browsing
* City-wise browsing
* City + category browsing
* Listing details page
* Add listing page
* Login and registration pages
* My Listings page
* Profile section
* Loading, empty and error states
* Responsive design for different screen sizes

---

## 🛠️ Tech Stack

### Backend

* Java
* Spring Boot
* Spring MVC
* Spring Data JPA
* Hibernate
* Spring Security
* REST APIs
* Maven

### Database

* MySQL

### Frontend

* Thymeleaf
* HTML5
* CSS3
* JavaScript

### Tools

* IntelliJ IDEA
* MySQL Workbench
* Postman
* Git
* GitHub

---

## 🏗️ Project Architecture

```text
Frontend
   ↓
Controller
   ↓
Service
   ↓
Repository
   ↓
MySQL Database
```

The application follows a layered architecture:

```text
Controller
    ↓
Service
    ↓
Repository
    ↓
Database
```

---

## 📁 Project Structure

```text
marketplace/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── marketplace/
│   │   │           └── marketplace/
│   │   │               ├── config/
│   │   │               ├── controller/
│   │   │               ├── entity/
│   │   │               ├── repository/
│   │   │               └── service/
│   │   │
│   │   └── resources/
│   │       ├── static/
│   │       │   ├── css/
│   │       │   ├── js/
│   │       │   └── images/
│   │       │
│   │       ├── templates/
│   │       │   ├── index.html
│   │       │   ├── login.html
│   │       │   ├── register.html
│   │       │   ├── add-listing.html
│   │       │   ├── listing-details.html
│   │       │   ├── category.html
│   │       │   ├── city.html
│   │       │   ├── city-category.html
│   │       │   ├── my-listings.html
│   │       │   └── ...
│   │       │
│   │       └── application.properties
│   │
│   ├── pom.xml
│   └── database/
│       └── marketplace_db.sql
│
├── .gitignore
├── mvnw
├── mvnw.cmd
└── pom.xml
```

---

## 🗄️ Database

The project uses **MySQL**.

Database name:

```text
marketplace_db
```

Main entities include:

* User
* Listing
* Category
* Subcategory

### Database Relationships

```text
User
  │
  └── Listings

Category
  │
  └── Subcategory
        │
        └── Listings
```

A listing belongs to a user, category, and subcategory.

---

## ⚙️ Setup & Installation

### 1. Clone the repository

```bash
git clone <your-github-repository-url>
```

### 2. Open the project

Open the project in **IntelliJ IDEA** or another Java IDE.

### 3. Create MySQL database

Create the database:

```sql
CREATE DATABASE marketplace_db;
```

### 4. Configure MySQL

Update the database configuration in:

```text
src/main/resources/application.properties
```

Example:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/marketplace_db
spring.datasource.username=root
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

Do not commit your real database password to GitHub.

### 5. Import sample database

If the provided SQL dump is used, import:

```text
database/marketplace_db.sql
```

into MySQL.

### 6. Run the application

Using Maven:

```bash
mvn spring-boot:run
```

Or run the main Spring Boot application class from IntelliJ IDEA.

### 7. Open the application

```text
http://localhost:8080
```

---

## 🔐 Authentication

The application uses **Spring Security** for authentication and authorization.

### Roles

```text
USER
ADMIN
```

### USER

A normal user can:

* Register
* Login
* Create listings
* View listings
* Edit their own listings
* Delete their own listings
* View their own listings

### ADMIN

Admin can additionally manage:

* Users
* Categories
* Subcategories
* Listings

---

## 🌐 Main Pages

| Page             | Purpose                  |
| ---------------- | ------------------------ |
| `/`              | Marketplace homepage     |
| `/register`      | User registration        |
| `/login`         | User login               |
| `/add-listing`   | Create a listing         |
| `/category`      | Category-wise listings   |
| `/city`          | City-wise listings       |
| `/city-category` | City + category listings |
| `/listing/{id}`  | Listing details          |
| `/my-listings`   | User's own listings      |

---

## 🔌 Main REST APIs

### Users

```text
POST   /api/users
GET    /api/users
GET    /api/users/{id}
DELETE /api/users/{id}
```

### Listings

```text
POST   /api/listings
GET    /api/listings
GET    /api/listings/{id}
PUT    /api/listings/{id}
DELETE /api/listings/{id}
```

### Listing Filters

```text
GET /api/listings/city/{city}

GET /api/listings/category/{categoryName}

GET /api/listings/city/{city}/category/{categoryName}

GET /api/listings/search?keyword={keyword}
```

### Categories

```text
GET    /api/categories
POST   /api/categories
PUT    /api/categories/{id}
DELETE /api/categories/{id}
```

### Subcategories

```text
GET    /api/subcategories
POST   /api/subcategories
GET    /api/subcategories/{id}
DELETE /api/subcategories/{id}
```

### Authentication

```text
GET /api/auth/me
```

---

## 📋 Assignment Requirements Covered

The project covers the main marketplace requirements:

* [x] User registration
* [x] Product/service listing
* [x] Listing name
* [x] Listing details
* [x] Category
* [x] Subcategory
* [x] Country
* [x] State
* [x] City
* [x] Area
* [x] Price
* [x] Listing displayed on frontend after submission
* [x] Category-wise listing
* [x] City-wise listing
* [x] City + category-wise listing
* [x] Individual listing page

Additional functionality includes authentication, authorization, search, listing management, validation, and responsive UI.

---

## 🧪 API Testing

The REST APIs were tested using **Postman**.

Example listing creation request:

```http
POST /api/listings
Content-Type: application/json
```

Example:

```json
{
  "type": "PRODUCT",
  "name": "Samsung Galaxy S24",
  "detail": "Excellent condition smartphone",
  "country": "India",
  "state": "Madhya Pradesh",
  "city": "Indore",
  "area": "Vijay Nagar",
  "price": 45000,
  "category": {
    "id": 1
  },
  "subcategory": {
    "id": 1
  }
}
```

---

## 🔒 Security Notes

* Passwords are stored using BCrypt hashing.
* Database credentials should be configured locally.
* Sensitive configuration should not be committed to GitHub.
* The application uses role-based authorization for protected operations.

---

## 🎯 Project Objective

The objective of this project is to build a simple marketplace platform where users can register, create product or service listings, and discover listings based on **category, city, and search criteria**.

The project demonstrates practical implementation of:

* Java
* Spring Boot
* REST API development
* Spring Data JPA
* MySQL
* Spring Security
* Thymeleaf
* HTML/CSS/JavaScript
* Authentication and authorization
* CRUD operations
* Git/GitHub

---

## 👨‍💻 Developer

**Shiva Maurya**

B.Tech Computer Science
Java | Spring Boot | REST API | MySQL

---

## 📌 Note

This project was developed as a marketplace web application assignment and implemented using **Java + Spring Boot + Thymeleaf**.
