This project demonstrates a complete, production-style workflow for deploying a Node.js application on AWS EKS, using Terraform for infrastructure and GitHub Actions for CI/CD.

The focus is on clear separation of concerns, cost control, and automation best practices.

🏗 Architecture Overview
Developer
  ↓
GitHub Actions (CI/CD)
  ├── Terraform (Infrastructure)
  │     ├── EKS Cluster
  │     ├── Managed Node Group (EC2)
  │     └── ECR Repository
  │
  ├── Docker Build
  │     └── Push Image to ECR
  │
  └── Kubernetes Deploy
        ├── Deployment (Node.js App)
        └── Service (LoadBalancer / ClusterIP)
  
Internet
  ↓
AWS Load Balancer
  ↓
Kubernetes Service
  ↓
Pods (Node.js Containers)

📦 Tech Stack

AWS: EKS, EC2, ECR, IAM, S3

Infrastructure as Code: Terraform

Containerization: Docker

Orchestration: Kubernetes

CI/CD: GitHub Actions

Backend: Node.js (Express)

🔁 CI/CD Workflows

This project uses multiple GitHub Actions workflows, each with a single responsibility:

1️⃣ Infrastructure – Create

Runs terraform apply

Provisions:

EKS cluster

Node group (EC2)

ECR repository

Uses S3 remote backend for Terraform state

2️⃣ Infrastructure – Destroy

Runs terraform destroy

Cleans up all AWS resources

Prevents accidental cloud costs

3️⃣ Docker Build & Push

Builds Node.js Docker image

Pushes image to Amazon ECR

No local Docker required

4️⃣ Application Deploy

Updates kubeconfig for EKS

Runs kubectl apply

Deploys application to the cluster

5️⃣ Application Remove

Runs kubectl delete

Removes app without deleting infrastructure

All workflows are manual (workflow_dispatch) for safety.

🧠 Key Design Decisions
✅ Infrastructure and Application are Separate

Infrastructure changes are rare

Application changes are frequent

Separate pipelines reduce risk and improve clarity

✅ Manual Deploy & Destroy

Prevents accidental deployments

Strong cost control

Mirrors real production practices

✅ Terraform Remote State (S3)

Shared state across CI runs

Safe destroy operations

Industry-standard approach

✅ Small Resource Limits

Optimized for free-tier / low-cost usage

Prevents pod scheduling issues on small nodes

💸 Cost Control Strategy

Cost awareness was a key goal of this project:

✔ Manual infrastructure creation

✔ Manual infrastructure destruction

✔ Single EKS node (t3.micro)

✔ Resource limits on pods

✔ One LoadBalancer only

✔ No always-on environments

Nothing runs unless explicitly started.

📁 Repository Structure
.
├── infra/                 # Terraform (EKS, ECR, IAM, state backend)
├── app/                   # Node.js application
├── docker/                # Dockerfile
├── k8s/                   # Kubernetes manifests
├── .github/workflows/     # GitHub Actions pipelines
└── README.md

🚀 What This Project Demonstrates

End-to-end cloud deployment

Real CI/CD patterns

Kubernetes fundamentals

Terraform best practices

AWS EKS architecture

Cost-conscious engineering

This is not a tutorial project, but a realistic production-style setup.

🧪 Future Enhancements (Optional)

Ingress + ALB Controller

HTTPS with ACM

Horizontal Pod Autoscaler (HPA)

Versioned Docker image tags

Multi-environment setup (dev / prod)

Helm charts

📌 Final Note

This project is intentionally simple but complete.
It focuses on understanding the “why”, not just the “how”.
