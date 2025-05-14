# Database-Week-8
# Clinic Booking System Database

## Project Description

This project implements a **Clinic Booking System** using MySQL. It models a real-world scenario where a clinic manages patients, doctors, appointments, and medical services. The database is normalized and demonstrates 1-to-many and many-to-many relationships with appropriate constraints.

## Features
- Tracks patient and doctor information
- Supports scheduling appointments
- Associates services with each appointment
- Enforces data integrity through constraints and relationships

## 🗃️ Database Structure

The database consists of the following tables:

| Table Name           | Description                                      |
|----------------------|--------------------------------------------------|
| `patient`            | Stores personal details of patients              |
| `doctor`             | Stores doctor details and specialties            |
| `service`            | List of services offered by the clinic           |
| `appointment`        | Records appointments between patients and doctors|
| `appointment_service`| Join table for many-to-many relationship between appointments and services |

## Entity-Relationship Diagram (ERD)

![ERD](A_two-dimensional_Entity-Relationship_Diagram_(ERD.png)

## ⚙️ How to Setup

1. Make sure you have MySQL installed.
2. Clone this repository or download the `.sql` file.
3. Open your MySQL client (e.g., MySQL Workbench).
4. Create the database or let the script handle it:
   ```sql
   CREATE DATABASE IF NOT EXISTS clinic_bookingDB;
