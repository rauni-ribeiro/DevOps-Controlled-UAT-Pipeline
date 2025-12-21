# Azure DevOps – UAT Pipeline Demo

This repository contains a **simple Azure DevOps pipeline** built to demonstrate core **CI/CD concepts** rather than application complexity.

The focus of this project is on **pipeline behavior, environment awareness, variable management, artifact generation, and troubleshooting**.

-------

## 📌 What This Project Does

The pipeline runs a Python script that:

- Reads environment variables injected by Azure DevOps
- Executes only when the target environment is `UAT`
- Generates a message containing build metadata
- Produces and publishes a build artifact (`message.txt`)

This mirrors a **controlled UAT execution flow** commonly used in real deployment pipelines.

-------

## 🧱 Repository Structure

.
├── azure-pipelines.yml
├── main.py
└── README.md


-------

## 🐍 Application Logic

The Python script (`main.py`) is intentionally minimal and focuses on **runtime context validation**.

It:
- Reads `ENVIRONMENT`, `GREETING_TARGET`, and `BUILD_BUILDID`
- Skips execution if the environment is not `uat`
- Writes a message to `out/message.txt`
- Acts as a real artifact producer for the pipeline

-------

## 🔁 Azure DevOps Pipeline

Pipeline highlights:

- Manual trigger (UAT-focused)
- Parameter-based environment selection
- Self-hosted agent
- Variable Group integration
- Graceful handling of missing tests
- Artifact publishing

The pipeline validates runtime configuration, executes the application logic, and publishes the output as an artifact.

-------

## 🔐 Variable Groups

Environment-specific values are injected via an Azure DevOps **Variable Group**, keeping configuration separate from pipeline logic and enabling safe, reusable environment setups.

-------

## 📦 Build Artifact

The pipeline generates and publishes:
### out/message.txt --> "[uat] - Hello Rauni Ribeiro, your current build is 8".


This confirms correct variable injection and runtime execution.

-------

## 🚀 Future Improvements

Planned next steps include:

- Infrastructure provisioning using **Terraform**
- Environment-specific infrastructure (UAT / PROD)
- Multi-stage pipelines (infra → application)
- Artifact deployment to cloud resources

These improvements will evolve the project into a **full CI/CD + IaC workflow**.

-------

## 🏁 Summary

This project demonstrates **practical DevOps fundamentals**:
- CI/CD pipelines
- Environment-based execution
- Variable management
- Artifact lifecycle
- Debugging and troubleshooting mindset

The goal is clarity and correctness, with a clear path for future expansion.




