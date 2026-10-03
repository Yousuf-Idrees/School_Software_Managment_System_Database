# 🏫 School Management System

[![Database](https://img.shields.io/badge/Database-PostgreSQL%20%2F%20MySQL-blue.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A centralized digital platform designed to streamline academic and administrative operations for schools. Built around strict **Role-Based Access Control (RBAC)**, the system manages student and teacher records, class schedules, daily attendance tracking, automated grade calculations, parent-teacher communication bridges, and administrative analytics.

---

## 📌 Table of Contents
- [System Architecture](#-system-architecture)
- [Key Features & Modules](#-key-features--modules)
- [Business Rules & Constraints](#-business-rules--constraints)
- [Database Analytics & Queries](#-database-analytics--queries)
- [Getting Started](#-getting-started)
- [License](#-license)

---

## 🏗️ System Architecture

```mermaid
graph TD
    A[School Management System] --> B[Admin]
    A --> C[Teacher]
    A --> D[Student]
    A --> E[Parent]

    B --> B1[User & Profile Management]
    B --> B2[System Backups & Audit Logs]
    B --> B3[Global Announcements & Reports]

    C --> C1[Daily Class Attendance]
    C --> C2[Grade Entry & Auto-Averages]
    C --> C3[Class Announcements & Student Messaging]

    D --> D1[View Personal Grades & Attendance]
    D --> D2[Message Assigned Subject Teachers]

    E --> E1[View Linked Child Records]
    E --> E2[Message Admin / Request Reports]

✨ Key Features & Modules
🔐 1. Authentication & Access Control
Role-Based Access Control (RBAC): Strict authentication with unique credentials and permission sets enforced across four user roles: Admin, Teacher, Student, and Parent.
Audit Logging: System-wide activity logs track administrative and user actions for security compliance.
🏫 2. Class & Academic Management
Classroom Capacity: Hard limits enforced per class section (maximum 30 students per room).
Enrollment Limits: Students belong to 1 primary class and academic year, taking up to a maximum of 7 subjects.
Teaching Assignments: Teachers focus on 1 specialized subject and manage up to 3 class sections per academic year.
📊 3. Attendance & Grading System
Daily Attendance: Simple daily recording interface per class section with real-time status categorization (Present, Absent, Late).
Automated Grade Averages: Grade entry module that auto-computes subject averages and triggers instant notifications to students upon grade publication.
💬 4. Controlled Communication Framework
To ensure safety and proper administrative boundaries, direct messaging is strictly regulated:
Students: May message only the teachers currently assigned to their subjects (peer-to-peer messaging is strictly blocked).
Teachers: May message individual students assigned to their classes.
Parents: Communicate exclusively with Admins for support, inquiry submission, and official report requests.
📐 Business Rules & Constraints
Rule Area	Constraint Description
Account Management	Only Admins hold permissions to delete or deactivate user accounts.
Parent Links	A single student profile can be linked to a maximum of 2 parent accounts.
Data Privacy	Students and parents can strictly view only their own personal academic records, grades, and attendance.
Scope Enforcement	Teachers can manage content, publish announcements, and log grades only for their assigned classes and subject.
📈 Database Analytics & Queries
The underlying relational schema includes pre-optimized SQL analytical queries tailored for school administration:
Analytical Query	Business Objective	Functional Output
Average Grade per Subject	Curricular Assessment	Computes average marks and total student count per subject to evaluate departmental performance.
Daily Attendance Summary	Operations & Safety	Real-time dashboard grouping student body into Present, Absent, and Late tallies.
Class Performance & Teacher Report	Cross-Department Visibility	Multi-table join linking physical classroom locations (floors) with assigned faculty.
Parent-Teacher Communication Bridge	Stakeholder Engagement	Maps parent-student connections to assigned teachers for rapid conference coordination.
🚀 Getting Started
Prerequisites
Relational Database Engine (PostgreSQL 13+, MySQL 8.0+, or SQL Server).
Application Server Environment (Node.js, Python, or Java).

Installation & Setup
Clone the repository:

git clone [https://github.com/your-username/School-Management-System.git](https://github.com/your-username/School-Management-System.git)
cd School-Management-System

Initialize Database Schema & Rules:

psql -U your_username -d school_db -f schema.sql

Execute Pre-built Analytical Queries:

psql -U your_username -d school_db -f queries.sql
