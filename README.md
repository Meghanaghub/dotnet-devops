# 🌟 **Cloud‑Native .NET + Azure DevOps Project**

### *AKS | ACR | Docker | Terraform | Helm | GitHub Actions | Observability | Secrets*

This project demonstrates an **end‑to‑end cloud‑native microservice** built with **.NET 8**, containerized with **Docker**, and deployed to **Azure Kubernetes Service (AKS)** using **Helm** and **Kubernetes Secrets**, with infrastructure provisioned via **Terraform**, and full observability enabled using **Application Insights + Log Analytics**.

It is designed to reflect **real-world DevOps, Azure, and Kubernetes workflows** used in modern product companies.

***

# 🏗️ **High‑Level Architecture**

    Developer → GitHub Repo → CI Pipeline (Build/Test)
                 |
                 v
             Docker Build → ACR (Image Repository)
                 |
                 v
            Helm Deployment (Manual CD)
                 |
                 v
          Azure Kubernetes Service (AKS)
       - Deployments, Pods, LoadBalancer Service
       - Kubernetes Secrets (Secure App Insights Key)
                 |
                 v
    Observability Layer:
     Application Insights + Log Analytics + AKS Insights

***

# 🚀 **Tech Stack**

### **Languages & Frameworks**

*   .NET 8 Web API

### **DevOps & Cloud**

*   Docker
*   Azure Container Registry (ACR)
*   Azure Kubernetes Service (AKS)
*   Terraform (IaC)
*   Helm Charts
*   GitHub Actions (CI)
*   Kubernetes Secrets (secure config)

### **Observability**

*   Application Insights
*   Log Analytics Workspace
*   Kusto Query Logs (KQL)
*   AKS Insights (metrics, containers, nodes)

***

# 📦 **Features Implemented**

### ✔ Full CI Pipeline (GitHub Actions)

*   Build
*   Restore
*   Test
*   Docker build
*   Tagging (v1, v3, v4…)
*   Push to ACR

> CD is manual via Helm (tenant restrictions prevented SP/OIDC automation).

***

### ✔ Dockerized .NET Application

*   Multi-stage Dockerfile
*   Version-tagged images (v1, v3, v4)
*   Pushed to ACR
*   Pulled from AKS securely using imagePullSecrets

***

### ✔ Infrastructure as Code (Terraform)

Provisioned:

*   Resource Group
*   Virtual Network + Subnets
*   AKS Cluster
*   ACR
*   Node Pool
*   Outputs for kube config & subnets

Everything fully reproducible.

***

### ✔ Kubernetes Deployment (Helm)

Helm chart includes:

*   Deployment template
*   Service template
*   values.yaml
*   env variable injection
*   SecretKeyRef
*   imagePullSecrets → ACR

<!---->

    helm upgrade dotnetapp ./dotnet-app-chart -n dotnet-app

***

### ✔ LoadBalancer Service

Exposes app publicly:

    EXTERNAL-IP: 20.103.15.50

You can access your API via:

    http://20.103.15.50/weatherforecast

***

### ✔ Observability (App Insights + Log Analytics + AKS Insights)

You enabled full observability:

*   Live Metrics Stream
*   Request/Failure logs
*   ContainerLogV2
*   Pod logs
*   Kusto queries
*   Node CPU/Memory
*   Pod restart counts

Real production-grade monitoring.

***

### ✔ Secure Secret Management

*   No secrets in GitHub

*   appsettings.json removed

*   Kubernetes Secrets store:

    *   App Insights Connection String
    *   Sample db-secret
    *   acr-auth (dockerconfigjson)

*   Injection via Helm `env:` block

*   .NET loads secrets via environment variables

***

# 📁 **Repository Structure**

    |-- dotnet-devops-project/
    |     |-- Controllers/
    |     |-- Program.cs
    |     |-- Dockerfile
    |     |-- dotnet-devops-project.csproj
    |
    |-- dotnet-app-chart/ (Helm chart)
    |     |-- templates/
    |     |-- values.yaml
    |
    |-- terraform/
    |     |-- main.tf
    |     |-- variables.tf
    |     |-- outputs.tf
    |
    |-- .github/workflows/ci.yml
    |-- README.md (this file)

***

# 📸 **Screenshots**

***

### **1. AKS Running Pods**

    kubectl get pods -n dotnet-app

screenshots/aks-pods.png

***

### **2. ACR Repository**

screenshots/acr-repo.png

***

### **3. Helm Release**

screenshots/helm-release.png

***

### **4. LoadBalancer External IP**

screenshots/loadbalancer.png

***

### **5. Application Insights – Live Metrics**

screenshots/appinsights.png

***

### **6. Log Analytics – Kusto Query Logs**

screenshots/kusto-logs.png

***

### **7. Terraform Apply**

screenshots/terraform-apply.png

***

### **8. Docker Image Build**

screenshots/docker-build.png

***

### **9. Namespace + Secrets (non-sensitive)**

screenshots/namespace-secrets.png

***

# 🎯 **How to Deploy the App Yourself**

### 1️⃣ Build & Push Image

```sh
docker build -t mbdevopsacr01.azurecr.io/dotnet-devops-project:v4 .
docker push mbdevopsacr01.azurecr.io/dotnet-devops-project:v4
```

### 2️⃣ Update values.yaml

```yaml
tag: "v4"
```

### 3️⃣ Helm Upgrade

```sh
helm upgrade dotnetapp ./dotnet-app-chart -n dotnet-app
```

***

# 🧠 **Key Learnings**

*   Containerization ensures consistent deployments
*   Helm simplifies Kubernetes packaging
*   Terraform makes infrastructure reproducible
*   Observability is essential for debugging
*   Kubernetes Secrets secure sensitive config
*   AKS offers scalable and self-healing deployments
*   CI pipelines guarantee stability
*   Logging + monitoring closes the DevOps feedback loop

***

# ⭐ **Why This Project is Valuable**

This project demonstrates **real-world DevOps flow**, including:

*   Cloud-native development
*   Infrastructure automation
*   Containerization
*   Kubernetes orchestration
*   Helm release management
*   Logging & observability
*   Secrets and security best practices

It reflects what **actual DevOps engineers** do in top tech/product companies.

***

# 🙌 **Author**

**MB – DevOps Engineer**  
Azure | AKS | .NET | Kubernetes | Terraform | Helm | Cloud-Native

If you found this project useful, feel free to ⭐ star the repo.

***
