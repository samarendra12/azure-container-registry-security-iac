# Azure Container Registry Security & Geo-Replication IaC
### High-Availability Docker Image Registry with Content Trust & Retention Policies

[![ACR](https://img.shields.io/badge/Azure-Container_Registry-0078D4?style=for-the-badge&logo=docker&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://terraform.io/)

Features:
- **SKU**: Premium with Zone-Redundant Geo-Replication across primary & secondary regions.
- **Content Trust**: Docker Content Trust (DCT) image signing verification.
- **Image Lifecycle Governance**: Automated 30-day retention policies purging untagged images.
- **Least-Privilege**: Admin credentials disabled in favor of Managed Identity / Entra ID authentication.
