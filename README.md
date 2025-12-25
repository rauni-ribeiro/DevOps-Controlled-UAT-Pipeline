# Azure DevOps – Controlled UAT CI/CD Pipeline with Terraform

This repository contains an **environment-aware CI/CD pipeline** designed for **controlled UAT execution**, **variable groups**, **artifact management**, and **infrastructure provisioning using Terraform**.

The focus of this project is on **pipeline behavior, environment awareness, compile-time vs runtime variables, artifact generation, infrastructure provisioning, and troubleshooting**.

---

## 📌 What This Project Does

This project combines **application execution** and **infrastructure provisioning** in a single controlled pipeline.

The pipeline:

### Application layer
- Reads environment variables injected by Azure DevOps
- Executes only when the target environment is `UAT`
- Generates a message containing build metadata
- Produces and publishes a build artifact (`message.txt`)

### Infrastructure layer (Terraform)
- Initializes Terraform from a dedicated `infra/` directory
- Plans infrastructure changes using environment-specific `.tfvars`
- Applies infrastructure **only when the environment is UAT**
- Exposes Terraform outputs for validation and future integration

This mirrors a **real-world controlled UAT execution and provisioning flow** used in CI/CD pipelines.

---

## 🧱 Repository Structure

This repository is organized to clearly separate **application code**, **infrastructure as code**, and **environment-specific configurations**, following real-world DevOps best practices.

```text
.
├── azure-pipelines.yml      # Azure DevOps CI/CD pipeline definition
├── main.py                  # Application entry point
├── README.md                # Project documentation
│
├── infra/                   # Terraform infrastructure code
│   ├── main.tf              # Core infrastructure resources
│   ├── variables.tf         # Input variable definitions
│   └── outputs.tf           # Exported infrastructure outputs
│
└── .tfvars/                 # Environment-specific Terraform variables
    ├── dev.tfvars           # Development environment values
    ├── uat.tfvars           # UAT (User Acceptance Testing) values
    └── production.tfvars    # Production environment values



---

## 🐍 Application Logic

The Python script (`main.py`) is intentionally minimal and focuses on **runtime context validation**.

It:
- Reads `ENVIRONMENT`, `GREETING_TARGET`, and `BUILD_BUILDID`
- Skips execution if the environment is not `uat`
- Writes a message to `out/message.txt`
- Acts as a real artifact producer for the pipeline

---

## 🔁 Azure DevOps Pipeline

Pipeline highlights:

- Manual trigger with parameter-based environment selection
- Compile-time environment definition via pipeline parameters
- Runtime variable injection via Variable Groups
- Self-hosted agent execution
- Graceful handling of missing tests
- Terraform init / plan / apply workflow
- Conditional Terraform apply (UAT-only safeguard)
- Artifact publishing

The pipeline enforces a **clear separation between compile-time structure and runtime execution**, following DevOps best practices.

---

## 🔐 Variable Groups & Environment Control

- `ENVIRONMENT` is defined at **compile-time** via pipeline parameters
- Sensitive or environment-specific values (e.g. `GREETING_TARGET`) are injected at **runtime** via Azure DevOps Variable Groups
- Built-in pipeline variables (e.g. `BUILD_BUILDID`) are consumed directly at runtime

This approach improves **security, clarity, and reusability** across environments.

---

## 🧱 Terraform Infrastructure

Terraform follows a clean and modular structure:

- Resource definitions in `infra/main.tf`
- Variable declarations in `infra/variables.tf`
- Environment-specific values in `.tfvars/*`
- Outputs exposed via `infra/outputs.tf`

Infrastructure is:
- **Planned** for all environments
- **Applied only in UAT**, preventing accidental changes in production-like environments

---

## 📦 Build Artifact

The pipeline generates and publishes:

### out/message.txt  --> Example content: "[uat] - Hello Rauni Ribeiro - From DevOps Pipeline Var, your current build is 8"

This confirms correct variable injection, runtime execution, and artifact lifecycle handling.

---

## 🚀 Future Improvements

Planned next steps include:

- Remote Terraform state backend (Azure)
- Multi-stage pipelines (plan → approval → apply)
- Promotion flow (UAT → Production)
- Consuming Terraform outputs in application steps
- Deploying artifacts to provisioned cloud resources

These improvements will evolve the project into a **full CI/CD + IaC workflow**.

---

## 🏁 Summary

This project demonstrates **practical, real-world DevOps fundamentals**:

- CI/CD pipeline design
- Compile-time vs runtime separation
- Environment-aware execution
- Variable group usage
- Terraform-based infrastructure provisioning
- Artifact lifecycle management
- Debugging and troubleshooting mindset

The goal is **clarity, safety, and scalability**, with a solid foundation for future expansion.



