# AWS Security Compliance with Terraform

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazonaws&logoColor=white)
![Security](https://img.shields.io/badge/Security-Compliance-green?style=for-the-badge)

This project provisions **AWS Config** and a set of **managed compliance rules** using Terraform, enabling automated verification of key AWS security best practices. It’s a minimal, repeatable setup that can be deployed from your local machine using VS Code.

---

## 📋 What This Project Does

AWS Config continuously evaluates your AWS resources against compliance rules. This Terraform project:

- Creates a secure **S3 bucket** for AWS Config data (with encryption, versioning, and correct bucket policies).
- Deploys an **IAM role** for AWS Config with the necessary permissions.
- Enables the **AWS Config recorder** and delivery channel.
- Adds 5 AWS-managed Config rules:
  1. **Root Account MFA Enabled** (`ROOT_ACCOUNT_MFA_ENABLED`)
  2. **CloudTrail Enabled** (`CLOUD_TRAIL_ENABLED`)
  3. **S3 Bucket Public Read Prohibited** (`S3_BUCKET_PUBLIC_READ_PROHIBITED`)
  4. **Encrypted EBS Volumes** (`ENCRYPTED_VOLUMES`)
  5. **Restricted SSH** (`INCOMING_SSH_DISABLED`)
- Provides a **PowerShell script** to quickly check compliance status from the CLI.


---

## 🚀 Quick Start

### 1. Prerequisites
- **AWS Account** with permissions for S3, IAM, and AWS Config.
- **Terraform** installed ([Download](https://developer.hashicorp.com/terraform/downloads)).
- **AWS CLI** installed and configured:
  ```powershell
  aws configure
  Enter your AWS Access Key, Secret Key, Region, and output format.


---

## What This Deploys

- **S3 bucket** (encrypted, versioned, correct bucket policy) for AWS Config logs.
- **IAM role** for AWS Config (managed policy: `AWS_ConfigRole`).
- **AWS Config**: configuration recorder + delivery channel.
- **Managed rules**:
  - `ROOT_ACCOUNT_MFA_ENABLED`
  - `CLOUD_TRAIL_ENABLED`
  - `S3_BUCKET_PUBLIC_READ_PROHIBITED`
  - `ENCRYPTED_VOLUMES`  _(portable alternative to EBS default encryption check)_
  - `INCOMING_SSH_DISABLED`

---

## Quick Start (Steps)

1. **Prereqs**
   - AWS account + permissions for S3, IAM, AWS Config.
   - Terraform installed.
   - AWS CLI configured:
     ```powershell
     aws configure
     ```

2. **Deploy**
   From the project root:
   ```powershell
   terraform init
   terraform apply -auto-approve -var "config_bucket_name=my-config-logs-<unique-id>"
3. Wait ~2–5 minutes for AWS Config to evaluate the rules.
4. Check Compliance (PowerShell)
   ```powershell
     .\scripts\check.ps1 -Region us-east-1
     ```
   Example:
```powershell
- root-account-mfa-enabled          : NON_COMPLIANT
- cloudtrail-enabled                : COMPLIANT
- s3-bucket-public-read-prohibited  : COMPLIANT
- encrypted-volumes                 : COMPLIANT
- restricted-ssh                    : NON_COMPLIANT
```
5. **Cleanup**
    ```powershell
   terraform destroy -auto-approve -var "config_bucket_name=my-config-logs-<unique-id>"
     ```

   


   
