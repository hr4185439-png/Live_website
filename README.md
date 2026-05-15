# 🏗️ Heyram Infrastructure

A premium, high-performance web experience for **Heyram Infrastructure**, featuring a modern single-page architecture, dynamic media integration, and a sophisticated recruitment portal.

---

## 🌟 Overview

Heyram Infrastructure is a state-of-the-art web application designed to showcase large-scale infrastructure projects and manage career opportunities. This repository contains the reorganized local development environment, optimized for rapid iterations on top of a production-grade frontend build.

## 🚀 Key Features

- **💎 Premium UI/UX**: A visually stunning interface with custom typography, smooth transitions, and a dark-themed aesthetic.
- **📽️ Dynamic Media**: Integration of high-quality video content and optimized imagery for an immersive user experience.
- **💼 Advanced Careers Portal**:
  - Paginated "Open Requirements" with horizontal job cards.
  - Interactive "Apply Now" popup with form validation.
  - Seamless Gmail integration for resume submissions.
- **🏗️ Projects Showcase**: Interactive project cards featuring video backgrounds and detailed descriptions.
- **📱 Fully Responsive**: Optimized for all devices, from desktops to mobile phones.

## 🛠️ Technology Stack

- **Frontend**: React (Production Build)
- **Styling**: Modern CSS with custom variables and animations.
- **Server**: Node.js (Local development server with SPA routing support).
- **Automation**: PowerShell-based patching system for code maintenance.

## 📂 Project Structure

```text
heyram-infrastructure/
├── app/                  # Application Source & Assets
│   ├── assets/           # Compiled JS, CSS, and shared media
│   ├── index.html        # Main Entry Point
│   └── *.mp4, *.jpg      # Hero and content media files
├── scripts/              # Maintenance & Automation
│   ├── serve.mjs         # Local dev server (SPA-aware)
│   └── *.ps1             # PowerShell utility scripts for UI updates
├── package.json          # Dependency configuration
└── README.md             # Project documentation
```

## 🚥 Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) (v16 or higher recommended)
- PowerShell (for running utility scripts on Windows)

### Installation

1. Clone the repository to your local machine.
2. Install the lightweight development dependencies:

```powershell
npm install
```

### Running Locally

To start the development server:

```powershell
npm run dev
```

The application will be available at: **`http://localhost:4173`**

## 🔧 Development Workflow

Since this project utilizes an extracted production build, modifications are handled through a combination of direct edits and automated scripts:

- **UI Refinements**: Modify `app/assets/index.css` for styling and `app/index.html` for structural changes.
- **Logic Updates**: JavaScript modifications should be performed in `app/assets/index.js`.
- **Automated Patches**: Use the provided PowerShell scripts in the `scripts/` directory for complex UI updates.

### 📜 Maintenance Scripts

The `scripts/` directory contains various PowerShell utilities to maintain and update the production bundle:

#### 🏛️ Navigation & Header
- `add_header_to_pages.ps1`: Injects global navigation headers.
- `add_navbar_to_career.ps1`: Adds a dedicated navbar to the Careers page.
- `undo_headers.ps1`: Reverts header injections if needed.

#### 💼 Careers Portal
- `update_careers_page.ps1`: The primary script for updating job listings and requirements.
- `update_career_apply_popup.ps1`: Manages the "Apply Now" form logic and UI.
- `fix_career_jsx.ps1`: Resolves JSX syntax issues in the careers component.

#### 🏗️ Projects Showcase
- `add_video_to_first_card.ps1`: Integrates video backgrounds into project cards.
- `implement_zigzag_layout.ps1`: Applies a modern zigzag layout to project sections.
- `animate_our_projects_text.ps1`: Adds entrance animations to project descriptions.

#### 🔧 Core Maintenance
- `cleanup_index_js.ps1`: Optimizes and cleans up the main JavaScript bundle.
- `emergency_fix_newlines.ps1`: Fixes encoding/newline issues after manual edits.
- `serve.mjs`: The local development server.

---

## 📄 License

Internal Project - Heyram Infrastructure © 2024.
