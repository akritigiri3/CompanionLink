# CompanionLink - Java JSP MySQL Coursework Website

This is a Maven WAR project that can be opened directly in IntelliJ IDEA and deployed on Apache Tomcat 11.0.18. It uses Java Servlets, JSP, CSS, MySQL, JDBC, DAO classes, model classes, utility classes, session management and a servlet filter.

## Local configuration already set

- MySQL host: `127.0.0.1`
- Port: `3306`
- Database: `companion_link`
- Username: `root`
- Password: `1234`
- MySQL Workbench connection name: `Companion Link`

Workbench connection name is only a Workbench label. The Java project connects by JDBC URL, username and password.

## Run steps

1. Open this folder in IntelliJ IDEA.
2. Let Maven import dependencies.
3. Open MySQL Workbench using the `Companion Link` connection.
4. Run `database/companionlink_schema.sql` in MySQL Workbench. This is the updated 3NF schema with separated profile, status, role, skill, request, visit, rating and report tables.
5. Add Tomcat server `apache-tomcat-11.0.18-windows`.
6. Deploy artifact `CompanionLink:war exploded`.
7. Application context: `/CompanionLink`.
8. Open `http://localhost:8080/CompanionLink/`.

## Demo logins

| Role | Email | Password |
|---|---|---|
| Admin | admin@companionlink.local | Admin123 |
| Senior | senior@companionlink.local | Senior123 |
| Volunteer active | volunteer@companionlink.local | Volunteer123 |
| Volunteer pending | pending@companionlink.local | Pending123 |

## Features included

- Registration and login for seniors and volunteers.
- SHA-256 password hashing.
- Duplicate email and phone validation.
- Role-based access control with `AuthFilter`.
- Admin approval/deactivation for volunteers and users.
- Senior companion request creation.
- Senior volunteer browsing and server-side search.
- Session-based volunteer wishlist.
- Senior visit tracking and volunteer rating.
- Safety report creation and admin handling.
- Volunteer open request browsing and request acceptance.
- Volunteer schedule and visit completion logging.
- Admin activity type CRUD.
- Admin monitoring for requests, visits, reports and contact enquiries.
- Admin analytics with SQL aggregate queries and normalized lookup tables/views.
- Profile management and password update.
- About and Contact/Help pages.
- Responsive JSP/CSS frontend without Bootstrap.

## Report support files

- SQL schema: `database/companionlink_schema.sql`
- PlantUML class diagram: `docs/class-diagram.puml`
- Test plan ideas: `docs/test-plan-suggestions.md`


## Database normalization note

The database schema has been updated to support 3NF. Common user data is stored in `users`, senior-only data is stored in `senior_profiles`, volunteer-only data is stored in `volunteer_profiles`, repeated volunteer skills are separated into `skills` and `volunteer_skills`, and calculated values such as volunteer average rating are produced using SQL views instead of being stored redundantly.
