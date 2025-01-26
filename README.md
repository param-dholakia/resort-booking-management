# resort-booking-management
A web-based application for managing resort bookings and reviews. Includes features for customers, managers, and staff to handle room assignments, bookings, and feedback seamlessly.

## Features
 * User-friendly booking interface.
 * Customer registration and login system.
 * Manager's dashboard to assign rooms and view bookings.
 * Real-time reviews and feedback submission.
 * Secure database for storing booking and user details.

## Technology Stack
 * Frontend: HTML, CSS, PHP
 * Backend: PHP
 * Database: MySQL (resort.sql)

## Setup Instructions

  ### 1. Clone the repository:
```
  git clone https://github.com/param-dholakia/resort-booking-management.git
```
  ### 2. Import the database:
    - Open phpMyAdmin.
    - Create a new database named resort.
    - Import the resort.sql file into the newly created database.
    - Configure the connection:
    - Update the connect.php file with your database credentials.
  ### 3.Launch the application:
    - Place the project folder in your web server directory (e.g., htdocs for XAMPP).
    - Start Apache and MySQL services.
    - Access the application at http://localhost/Project/index.php.

## Project Structure
```
    Project/
    ├── img/
    │   ├── bungalow.jpg
    │   ├── deluxe.jpg
    │   ├── double_room.jpg
    │   ├── presidential_suite.jpg
    │   ├── Resort.jpg
    │   └── single_room.jpg
    ├── include/
    │   ├── footer.php
    │   └── header.php
    ├── assignroom.php
    ├── booking.php
    ├── connect.php
    ├── contact.php
    ├── index.php
    ├── login.php
    ├── managerview.php
    ├── mreview.php
    ├── mroomview.php
    ├── msg.php
    ├── registartion.php
    ├── resort.sql
    ├── review.php
    ├── room.php
    ├── search.php
    └── style.css
```
