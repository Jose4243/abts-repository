# Kensington Community Library Application Suite (ABTS)
**Developer:** Jose Contreiras  
**Repository:** [https://github.com/Jose4243/abts-repository.git](https://github.com/Jose4243/abts-repository.git)  

---

## 1. Project Overview & Purpose
The **Kensington Community Library System** is a cross-platform progressive web and mobile application suite designed to modernize library member services. It provides secure authentication, digital membership identification, real-time catalog search, and administrative dashboard management without relying on external backend servers, utilizing client-side persistence (`localStorage`) and robust security guards.

---

## 2. Architecture & Directory Structure
The repository is structured into two core environments:
- `mobile-app/`: Progressive mobile web interface featuring a bottom navigation bar, digital ID pass, search module, settings, and authentication views.
- `web-app/`: Desktop administrative portal featuring multi-tab views (Dashboard, Members directory, and Book Catalog).
- `css/`: Centralized global stylesheets (`mobile.css`, `desktop.css`) supporting responsive layouts and dynamic theme engines.

---

## 3. Key Innovative Features (v2.0 Release)
1. **Google OAuth2 SSO & Salted Credential Simulation:** Implements secure client-side login validation that blocks unregistered emails and simulates Google Single Sign-On token handshakes.
2. **Global Persistent Dark Mode Engine:** A synchronized theme engine that persists user preferences across sessions using `localStorage` and direct DOM manipulation to prevent visual flashing.
3. **Real-Time Mobile-to-Desktop Session Sync:** The desktop dashboard dynamically synchronizes active mobile logins into the administrative Members management table.
4. **Mandatory Auth Guards:** Synchronous security checks embedded in the header of every protected view to prevent unauthorized deep-linking.

---

## 4. GitHub & GitHub Actions Workflow
- **Version Control:** Managed via feature branches, semantic commits, and direct main-branch deployment on GitHub Pages.
- **CI/CD Automation:** GitHub Actions workflows validate static assets, enforce linting standards, and automate build artifact verification for deployment readiness.

---

## 5. Release Notes (v2.0 Final Production Release)
| Version | Update Description | Key Features Added |
| :--- | :--- | :--- |
| **v1.0** | Initial Prototype | Basic static HTML views for mobile home and digital ID. |
| **v2.0** | Final Production Suite | • Added secure login/registration with unregistered account validation.<br>• Implemented Google SSO simulation.<br>• Developed dedicated `search.html` with real-time catalog filtering.<br>• Built global persistent Dark Mode across all views.<br>• Integrated real-time mobile session sync into desktop web dashboard (`web-app/`). |
