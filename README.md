📋 Project Description
----------------------
This is an educational project created to learn about distributed systems and continuous deployment (CD) using GitHub Actions and Railway.

🎯 What is the application about?
-------------------------------
This application is a minimal Node.js HTTP server that demonstrates:

- Basic Web Server: Node.js built-in `http` module
- Continuous Integration/Continuous Deployment (CI/CD): Automation with GitHub Actions
- Containerization: Dockerfile for building a production image
- Hosting Platform: Deploy to Railway (or any container-friendly host)

🏗️ Project Structure
--------------------
Railway/
├── index.js               # Minimal Node.js HTTP server
├── package.json           # NPM metadata and start script
├── Dockerfile             # Docker image definition
├── .dockerignore          # Files excluded from Docker context
├── .gitignore             # Files ignored by git
├── README.md              # This file
└── .github/
	 └── workflows/
		  └── ci.yml         # GitHub Actions workflow (build & publish)

📄 Components
------------
1. index.js
	- A simple HTTP server that responds with: "Hello World from Railway!"
	- Uses `process.env.PORT` so the hosting platform can control the port.

2. package.json
	- Declares the `start` script (`node index.js`) used by Railway and local development.

3. Dockerfile
	- Builds a small production image based on `node:18-alpine` and runs the app.

4. .github/workflows/ci.yml
	- GitHub Actions workflow that installs dependencies, does a basic validation, builds a Docker image, and publishes it to GitHub Container Registry (GHCR).

🚀 Deployment Flow
------------------
Deployment to Railway (Automatic via GitHub)

1. Developer pushes changes to the `main` branch on GitHub.
2. GitHub Actions runs `ci.yml` which validates and builds the Docker image.
3. Optionally, the image is pushed to GHCR.
4. On Railway, create a new project and choose "Deploy from GitHub". Select the repository and Railway will deploy using the `start` script or a Docker image if configured.

Deployment with Docker (Local)
------------------------------
Option 1: Docker (build and run locally)

```powershell
cd "C:\Users\Lenovo LOQ\Documents\Universidad\9no\Distribuida\Tareas\Railway"
# Build the image
docker build -t hola-railway:local .
# Run the container (map host port 3000 to container port 3000)
docker run -p 3000:3000 --rm hola-railway:local
# The application will be available at http://localhost:3000
```

Option 2: Docker Compose (recommended for multi-container setups)

```powershell
# If you have a docker-compose.yml, start the app
docker compose up -d
# Stop the app
docker compose down
```

🎓 Educational Purpose
---------------------
This project was created for educational purposes to learn about:

- Basic Node.js server development
- Version control with Git and GitHub
- Automation with GitHub Actions
- Containerization with Docker
- Deploying to modern hosting platforms (Railway)

🐳 Docker Requirements
---------------------
- Docker installed (version 20.10 or higher)
- Docker Compose (included in Docker Desktop)

📝 Notes
--------
- GitHub Actions: The provided workflow publishes images to GitHub Container Registry (GHCR). The workflow uses the automatic `GITHUB_TOKEN` and requires repository Actions permissions to publish packages (the workflow sets `packages: write`).
- Railway: The project uses `process.env.PORT`; when deploying on Railway make sure to configure the project to use the repository or Docker image as desired.
- Environment variables: Add secrets or environment variables in the Railway dashboard or GitHub Secrets depending on the deployment flow.

If you want, I can:
- initialize a Git repository here and create the initial commit,
- adapt the GitHub Actions workflow to only build (no push) or to publish to Docker Hub instead of GHCR,
- or create a `docker-compose.yml` to demonstrate running the container with a reverse proxy.

UI (static files)
------------------
I added a minimal web UI served from the `public/` folder that displays the greeting in the browser and includes a small client interaction (a button that shows an alert).

Files added:

- `public/index.html` — minimal HTML page with the greeting and a button
- `public/styles.css` — simple styles to center and present the message
- `public/script.js` — small client script that shows an alert when the button is clicked

To access the UI locally, run `npm start` and open:

```
http://localhost:3000/
```

Or build and run the Docker image and visit the same URL on the mapped port.

