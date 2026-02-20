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

# README

## Artificial Intelligence at Education - Ollama

The **AI-at-Education** project aims to create a **simple web application** that allows users to interact with a **Large Language Model (LLM)** running **locally** on their machine.  
The application functions as an **AI tutor**, helping students understand concepts in **mathematics, programming, world events**, and other educational topics, while maintaining **data privacy** through local execution.

---

## Table of Contents

| Section | Folder / File                     | Description                                        |
| ------: | --------------------------------- | -------------------------------------------------- |
|       1 | `docs/`                           | Project documentation                              |
|     1.1 | `docs/Ollama-at-Education.pdf`    | Ollama usage in educational environments (English) |
|     1.2 | `docs/Ollama-στην-Εκπαίδευση.pdf` | Ollama στην Εκπαίδευση (Greek)                     |
|       2 | `src/`                            | Application source code                            |
|     2.2 | `src/Docker/`                     | Docker deployment configuration                    |
|   2.2.1 | `src/Docker/docker-compose.yml`   | Multi-container Docker setup                       |
|   2.2.2 | `src/Docker/Dockerfile`           | Application Docker image definition                |
|   2.2.3 | `src/Docker/run-ollama.sh`        | Script to run Ollama service                       |
|     2.3 | `src/src/`                        | Front-end application (Vue 3 + Vite)               |
|   2.3.1 | `src/src/assets/`                 | Global styles and static assets                    |
|   2.3.2 | `src/src/components/`             | Reusable Vue components                            |
|   2.3.3 | `src/src/router/`                 | Application routing configuration                  |
|   2.3.4 | `src/src/stores/`                 | State management (Pinia)                           |
|   2.3.5 | `src/src/views/`                  | Application views/pages                            |
|   2.3.6 | `src/src/App.vue`                 | Root Vue component                                 |
|   2.3.7 | `src/src/main.ts`                 | Application entry point                            |
|       3 | `README.md`                       | Project documentation                              |
|       4 | `INSTALL.md`                      | Usage instructions                                 |

---

## 1. Features

- **Local LLM Interaction**  
  Utilizes **Ollama** to run language models locally, ensuring privacy and offline processing.

- **AI Tutor Persona**  
  Pre-configured to behave as a personal AI teacher that explains and guides users through educational topics.

- **Model Support**  
  Supports multiple open-source models, including:
  - Llama 3
  - Phi 3
  - Mistral
  - Gemma
  - Codestral

- **Fully Containerized**  
  The entire system (frontend and backend) is packaged using **Docker**, eliminating manual dependency installation.

- **CPU-Friendly**  
  By default, the application runs models using the **CPU**, requiring no GPU.
