<p align="center">
  <img src="https://www.especial.gr/wp-content/uploads/2019/03/panepisthmio-dut-attikhs.png" alt="UNIWA" width="150"/>
</p>

<p align="center">
  <strong>UNIVERSITY OF WEST ATTICA</strong><br>
  SCHOOL OF ENGINEERING<br>
  DEPARTMENT OF COMPUTER ENGINEERING AND INFORMATICS
</p>

<p align="center">
  <a href="https://www.uniwa.gr" target="_blank">University of West Attica</a> ·
  <a href="https://ice.uniwa.gr" target="_blank">Department of Computer Engineering and Informatics</a>
</p>

---

<p align="center">
  <strong>E-Learning</strong>
</p>

<h1 align="center">
  Artificial Intelligence at Education - Ollama
</h1>

<p align="center">
  <strong>Vasileios Evangelos Athanasiou</strong><br>
  Student ID: 19390005
</p>

<p align="center">
  <a href="https://github.com/Ath21" target="_blank">GitHub</a> ·
  <a href="https://www.linkedin.com/in/vasilis-athanasiou-7036b53a4/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  <strong>Viktor Romanyuk</strong><br>
  Student ID: 713242017024
</p>

<p align="center">
  <a href="https://github.com/vromanyu" target="_blank">GitHub</a> ·
  <a href="https://www.linkedin.com/in/viktor-r-2387822a1/" target="_blank">LinkedIn</a>
</p>

<hr>

<p align="center">
  <strong>Supervision</strong>
</p>

<p align="center">
  Supervisor: Christos Troussas, Assistant Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/christos-troussas/" target="_blank">UNIWA Profile</a>  ·
  <a href="https://gr.linkedin.com/in/christos-troussas" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Co-Supervisor: Akrivi Krouska, Assistant Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/akrivi-krouska-2/" target="_blank">UNIWA Profile</a>  ·
  <a href="https://www.linkedin.com/in/akrivi-krouska-ak/" target="_blank">LinkedIn</a>
</p>

</hr>

---

<p align="center">
  Athens, July 2024
</p>

---

<p align="center">
  <img src="https://www.homedock.cloud/_astro/ollama-logo-on-black-sand.C8U_3a1n_1N2Jl8.webp" width="250"/>
</p>

---

# INSTALL

## Artificial Intelligence at Education - Ollama

This guide explains how to install, configure, and run the **AI-at-Education** project using **Docker**.  
The application provides a **Vue.js web interface** connected to a **local LLM served by Ollama**, fully containerized for ease of use.

---

## 1. Prerequisites

Before starting, ensure the following software is installed on your system:

### 1.1 Operating System

- **Windows 10 / 11**
- **Linux**
- **macOS**

> Docker must be supported on your OS.

---

## 2. Required Software

### 2.1 Docker

- **Docker Engine** (latest stable version)
- **Docker Compose** (v2 or newer)

Verify installation:

```bash
docker --version
docker compose version
```

#### Git

Required to clone the repository:

```bash
git --version
```

### 2.2 Hardware Requirements

- Minimum:
  - 8 GB RAM
  - CPU with AVX support (recommended)
- Disk Space:
  - At least 10 GB free (models can be large)
- GPU (Optional):
  - NVIDIA GPU with CUDA support (for accelerated inference)

---

## 3. Installation & Setup

### 3.1 Clone the Repository

```bash
git clone https://github.com/E-Learning-aka-Uniwa/Ollama.git
cd Ollama
```

### 3.2 Start the Application

Run the entire stack using Docker Compose:

```bash
cd Ollama/Docker
docker compose up
```

This command will:

- Build and start the Vue.js frontend
- Start the Ollama backend
- Automatically download the default LLM model if not present

> First startup may take several minutes due to model downloads.

### 3.3 Access the Web Interface

Once the containers are running, open your browser and navigate to:

```bash
http://localhost:8080
```

You should now see the AI Tutor chat interface.

---

## 4. Model Management

### 4.1 Default Model

- The application uses `phi3:latest` by default.
- The model runs locally on your machine using CPU unless GPU support is enabled.

### 4.2 Download Additional Models

You can pull more models while the application is running.
Example:

```bash
docker exec ollama ollama pull llama3
```

Other popular options:

```bash
docker exec ollama ollama pull mistral
docker exec ollama ollama pull codellama
```

Downloaded models are cached and reused across restarts.

---

## 5. Technical Architecture

The application consists of two containerized services defined in `docker-compose.yml`:

| Service | Technology          | Description                                           | Port  |
| ------- | ------------------- | ----------------------------------------------------- | ----- |
| Ollama  | Ollama              | Hosts and serves the local Large Language Model (LLM) | 11434 |
| VueApp  | Vue.js + TypeScript | Web-based chat interface                              | 8080  |

---

## 6. Components Overview

### 6.1 Frontend

- Vue.js with TypeScript
- Communicates with Ollama using `@ollama/browser`
- Provides a simple, responsive chat UI

### 6.2 Backend

- Ollama
- Manages LLM lifecycle and inference
- Exposes a local API endpoint

### 6.3 Styling

- Standard CSS
- Scoped styles for a clean and user-friendly interface

---

## 7. GPU Support (Optional)

If you have an NVIDIA GPU, you can enable GPU acceleration.

### 7.1 Requirements

- NVIDIA GPU
- NVIDIA drivers installed
- NVIDIA Container Toolkit

### 7.2 Docker Compose Modification

Edit `docker-compose.yml` and add the following under the Ollama service:

```yaml
entrypoint: ["/usr/bin/bash", "run-ollama.sh"]
deploy:
  resources:
    reservations:
      devices:
        - driver: nvidia
          count: all
          capabilities: [gpu]
```

Restart the application:

```bash
docker compose down
docker compose up
```

---

## 8. Open the Documentation

1. Navigate to the `docs/` directory
2. Open the report corresponding to your preferred language:
   - English: `Ollama-at-Education.pdf`
   - Greek: `Ollama-στην-Εκπαίδευση.pdf`
