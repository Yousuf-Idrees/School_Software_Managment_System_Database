# School Management System

A centralized digital platform designed to streamline academic and administrative operations for schools. Built around strict role-based access control, the system manages student/teacher records, class schedules, daily attendance, automated grade calculations, parent-teacher communication bridges, and administrative analytics[cite: 26, 27, 31].

## System Architecture

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

Core Features & Module Breakdown
Role-Based Access Control (RBAC):
Strict authentication with unique usernames and role enforcement across 4 distinct user tiers (Admin, Teacher, Student, Parent).   
DOCX
+ 1
Audit logging for security and activity tracking.   
DOCX
+ 1
Academic & Class Management:
Strict capacity limits enforced per classroom (maximum 30 students per class).   
DOCX
+ 1
Students are enrolled in exactly one class and academic year, up to a maximum of 7 subjects.   
DOCX
+ 2
Teachers are assigned to 1 subject and can manage up to 3 classes per academic year.   
DOCX
+ 1
Attendance & Grade Management:
One-touch daily attendance recording per class with real-time summary tracking (Present, Absent, Late).   
DOCX
+ 2
Grade entry with automated average calculation and instant notifications triggered upon publication.   
DOCX
+ 1
Controlled Communication Framework:
Direct messaging strictly restricted by role:
Students can message only their assigned subject teachers (peer-to-peer messaging blocked).   
DOCX
+ 2
Teachers can message specific students within their assigned classes.   
DOCX
+ 2
Parents communicate exclusively with Admins for official report requests and support.

System Analytics & Analytical Queries
The underlying database schema includes pre-optimized analytical queries for school administration:   
DOCX
Analytical Query	Business Goal	Functional Output
Average Grade per Subject	Curricular Assessment	
Calculates mean subject scores alongside total student counts to evaluate curriculum difficulty. 
DOCX

Daily Attendance Summary	Operations & Safety	
Real-time quantitative dashboard categorizing daily attendance into Present, Absent, and Late. 
DOCX

Class Performance & Teacher Report	Cross-Departmental Visibility	
Multi-table join linking physical classroom locations (floors) with assigned subject teachers.  
DOCX

Parent-Teacher Communication Bridge	Stakeholder Engagement	
Maps student-parent relationships to assigned class teachers for immediate conference routing. 
DOCX

Key Business Rules & Constraints
Account Limits: Only Admins may delete accounts. A student account can link to at most 2 parent profiles.   
DOCX
+ 4
Data Privacy: Students and parents can strictly view only their own individual academic records, grades, and attendance.   
DOCX
+ 3
Teaching Constraints: Teachers are restricted to managing content, grades, and attendance exclusively for their assigned classes and single subject.   
DOCX
+ 2
Getting Started
Prerequisites
Relational Database Engine (e.g., PostgreSQL, MySQL, or SQL Server).   
DOCX
+ 1
Application Server Environment (e.g., Node.js, Python/Flask/Django, or Java Spring Boot).

# 1. Clone the repository
git clone [https://github.com/your-username/School-Management-System.git](https://github.com/your-username/School-Management-System.git)
cd School-Management-System

# 2. Run schema initialization and business rules script
psql -U your_user -d school_db -f schema.sql

# 3. Execute analytical queries
psql -U your_user -d school_db -f queries.sql
