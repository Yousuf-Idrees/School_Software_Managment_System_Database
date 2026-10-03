# School Management System

A centralized digital platform designed to streamline academic and administrative operations for schools. Built around strict role-based access control (RBAC), the system manages student and teacher records, class schedules, daily attendance tracking, automated grade calculations, parent-teacher communication bridges, and administrative analytics.

---

## User Roles & System Architecture

* **Admin:** Manages user accounts, configures system-wide settings, generates global reports, posts school announcements, and logs administrative audit trails.
* **Teacher:** Records class attendance, enters grades with automated averaging, posts class announcements, and messages assigned students.
* **Student:** Accesses individual course grades, tracks personal daily attendance, and communicates directly with assigned subject teachers.
* **Parent:** Views linked children's academic/attendance performance and submits formal inquiries or report requests to administration.

---

## Core Features & Modules

### 1. Authentication & Access Control
* **Role-Based Permissions:** Enforces strict boundary access across Admin, Teacher, Student, and Parent accounts.
* **Audit Logs:** Tracks system activity and administrative changes for operational security.

### 2. Class & Academic Management
* **Classroom Constraints:** Hard limit enforced at a maximum of 30 students per class.
* **Subject Limits:** Students are assigned to 1 class per academic year and enrolled in up to 7 subjects.
* **Teacher Allocations:** Teachers manage 1 specialized subject across up to 3 class sections per academic year.

### 3. Attendance & Grading System
* **Daily Attendance:** Quick daily logging per class section with status tracking (`Present`, `Absent`, `Late`).
* **Automated Grading:** Auto-calculates subject averages upon grade entry and notifies students instantly upon publication.

### 4. Controlled Communication Framework
* **Student Safety:** Students can message **only** their assigned subject teachers (peer-to-peer messaging is blocked).
* **Teacher Outreach:** Teachers can message individual students enrolled in their assigned sections.
* **Parent Inquiries:** Parents communicate strictly with Admins for official updates and report requests.

---

## Key Business Rules & Constraints

* **Account Management:** Only Admins have permissions to deactivate or delete user accounts.
* **Parent Links:** A maximum of 2 parent profiles can be linked to a single student account.
* **Data Privacy:** Students and parents can view only their own personal records, grades, and attendance.
* **Scope Enforcement:** Teachers are restricted to managing content exclusively for their assigned classes and subject.

---

## Database Analytics & Queries

| Analytical Query | Business Objective | Functional Output |
| :--- | :--- | :--- |
| **Average Grade per Subject** | Curricular Assessment | Computes mean subject marks and total student counts to evaluate curriculum difficulty. |
| **Daily Attendance Summary** | Operations & Safety | Real-time dashboard grouping daily attendance into `Present`, `Absent`, and `Late` totals. |
| **Class Performance & Teacher Report** | Departmental Visibility | Multi-table join linking physical classroom locations (floors) with assigned faculty. |
| **Parent-Teacher Communication Bridge** | Stakeholder Engagement | Maps parent-student connections to assigned teachers for rapid conference routing. |

---

## Getting Started

### Prerequisites

* Relational Database Engine (PostgreSQL 13+, MySQL 8.0+, or SQL Server)
* Application Runtime (Node.js, Python, or Java)

### Database Setup

```bash
# 1. Clone the repository
git clone https://github.com/your-username/School-Management-System.git
cd School-Management-System

# 2. Run schema initialization and business rules script
psql -U your_username -d school_db -f schema.sql

# 3. Execute analytical queries
psql -U your_username -d school_db -f queries.sql
