# Azure DevOps – Controlled UAT CI/CD Pipeline with Terraform

This repository contains an **environment-aware CI/CD pipeline** designed for **controlled UAT execution**, **variable groups**, **artifact management**, and **infrastructure provisioning using Terraform**.

The focus of this project is on **pipeline behavior, environment awareness, compile-time vs runtime variables, artifact generation, infrastructure provisioning, and troubleshooting**.

---

## 📌 What This Project Does

This project combines **application execution** and **infrastructure provisioning** in a single controlled pipeline.

The pipeline operates in two layers:

### Application layer
- Reads environment variables injected by Azure DevOps
- Executes only when the target environment is `UAT`
- Generates a message containing build metadata
- Produces and publishes a build artifact (`message.txt`)

### Infrastructure layer (Terraform)
- Initializes Terraform from the `infra/` directory
- Plans infrastructure changes using environment-specific `.tfvars`
- Applies infrastructure **only when the environment is UAT** (safety lock)
- Exposes Terraform outputs for validation and future integration

This mirrors a **real-world controlled UAT execution and provisioning flow** commonly used in production-grade CI/CD pipelines.

---

## 🧱 Repository Structure + Terraform Modularization

The repository is structured to clearly separate **pipeline logic**, **application code**, **infrastructure code**, and **environment configuration**.

```text
.
├── azure-pipelines.yml          # Azure DevOps CI/CD pipeline
├── main.py                      # Application entry point
├── README.md                    # Project documentation
│
├── .tfvars/                     # Environment-specific Terraform values
│   ├── dev.tfvars
│   ├── uat.tfvars
│   └── production.tfvars
│
└── infra/                       # Terraform root module
    ├── main.tf                  # Root infrastructure definition
    ├── variables.tf             # Root input variables
    ├── backend.tf               # Remote state backend (Azure Blob)
    ├── providers.tf             # Provider configuration
    ├── outputs.tf               # Exposed outputs
    │
    └── modules/
        └── backend_storage/     # Reusable Terraform module
            ├── main.tf
            ├── variables.tf
            ├── outputs.tf
            └── providers.tf


```



## 🐍 Application Logic (PYTHON)

The Python script (`main.py`) is intentionally minimal and focuses on **runtime context validation**.

It:
- Reads `ENVIRONMENT`, `GREETING_TARGET`, and `BUILD_BUILDID`
- Skips execution if the environment is not `uat`
- Writes a message to `out/message.txt`
- Acts as a real artifact producer for the pipeline

---

## 🔁 Azure DevOps Pipeline (CI/CD)

Pipeline highlights:

- Manual trigger with parameter-based environment selection
- Compile-time environment definition via pipeline parameters
- Runtime variable injection via Azure DevOps Variable Groups
- Self-hosted agent execution
- Graceful handling of missing tests
- Azure authentication via Service Connection
- Terraform init / plan / apply workflow
- Conditional Terraform apply (UAT-only safeguard)
- Artifact publishing

---

## 🔐 Variable Groups & Environment Control (SECURITY)

- `ENVIRONMENT` is defined at **compile-time**
- Sensitive values are injected at **runtime**
- Built-in pipeline variables are consumed directly

---

## 🧱 Terraform Architecture

Terraform follows a **root module + child module** structure with environment-specific `.tfvars`.

Infrastructure behavior:
- **Plan** runs for all environments
- **Apply** runs only when the environment is `UAT`

---

## 📦 Build Artifact

The pipeline generates and publishes:

- `out/message.txt`

Example:
[uat] - Hello Rauni Ribeiro - From DevOps Pipeline Var, your current build is 8

---

## 🚀 Future Improvements

- Remote Terraform state backend in Azure
- Multi-stage pipelines
- Promotion flow (UAT → Production)
- Consuming Terraform outputs
- Deploying artifacts to cloud resources

---

## 🏁 Summary

This project demonstrates **practical DevOps fundamentals**:
CI/CD pipelines, environment-aware execution, Terraform IaC, variable management, artifacts, and troubleshooting.

The goal is **clarity, safety, and scalability**.
