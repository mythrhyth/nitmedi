````md
# NITMedi – Medical Center Management System

## Overview

NITMedi is a full-stack Medical Center Management System developed for NIT Meghalaya.

It enables administrators and consultants (doctors/nurses) to manage patient records, consultations, and medicines in a secure, professional, and efficient way.

The project is built using:

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** PHP (PDO for secure database interactions)
- **Database:** MySQL

---

## Features

## User Roles

### Admin

- Manage students, teachers, and staff (Add / Update / Delete)
- Manage medicine inventory (Add / Update / Delete)
- View consultation records

### Consultant (Doctor/Nurse)

- Manage patient consultations
- Add consultation notes, diagnosis, and prescribed medicines
- Automatically calculate medicine totals

---

## Database Design

## Core Tables

### 1. `users`

Stores login credentials and role-based access for Admin and Consultant users.

### 2. `patients`

Stores student, teacher, and staff details.

### 3. `consultations`

Stores consultation records linked to patients and consultants.

### 4. `medicines`

Stores medicine details including stock quantity and pricing.

### 5. `consultation_medicines`

Links consultations with prescribed medicines and quantities.

---

## Installation

## Prerequisites

Make sure you have the following installed:

- PHP >= 8.0
- MySQL >= 5.7
- Apache / Nginx Server (XAMPP, LarTgon, or WAMP recommended)
- Git

---

## Setup Steps

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/NITMedi.git
cd NITMedi
````

### 2. Configure Database Connection

Copy the example config file:

```bash
cp db/config.example.php db/config.php
```

Then edit `config.php` and update your MySQL credentials:

* Database name
* Username
* Password

---

### 3. Import Database Schema

Import the SQL file provided in:

```bash
/db/schema.sql
```

into your MySQL database.

---

### 4. Run the Project

Start your local server (XAMPP / Laragon / WAMP) and open:

```text
http://localhost/medical_center/
```

---

## Project Structure

```text
NITMedi/
│
├── admin/                  # Admin panel pages
├── consultant/             # Consultant dashboard
├── db/                     # Database configuration and schema
│   ├── config.php          # Actual DB config (not pushed to GitHub)
│   └── config.example.php  # Example config (safe for GitHub)
│
├── includes/               # Shared helper functions
├── index.php               # Landing page with role selection
├── dashboard.php           # Main Consultant/Admin dashboard
└── README.md               # Project documentation
```

---

## Security Notes

* Never push `db/config.php` to GitHub
* Only `config.example.php` should be included in the repository
* Passwords should always be hashed using `password_hash()`
* Use prepared statements (PDO) to prevent SQL injection attacks

---

## Contribution Guidelines

### 1. Fork the Repository

### 2. Create a New Branch

```bash
git checkout -b feature-name
```

### 3. Commit Your Changes

Use clear and meaningful commit messages.

### 4. Push and Create Pull Request

Push your branch and open a Pull Request.

---

## License

This project is licensed under the **MIT License**.

---

## Author

Developed for **NIT Meghalaya** as a Medical Center Management System project.

```
```
