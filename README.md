# Terraform-AWS

My personal Terraform learning journey on AWS. This repository contains notes, configurations, and hands-on practice projects as I explore Infrastructure as Code (IaC) from the ground up.

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)

**Topics:** `aws` · `aws-cli` · `aws-ec2` · `aws-s3` · `aws-dynamodb` · `aws-lambda` · `aws-sdk` · `terraform` · `terraform-module` · `hashicorp`

---

## Table of Contents

1. [Repository Structure](#repository-structure)
2. [How This Repo Is Organized](#how-this-repo-is-organized)
3. [Folder Details](#folder-details)
4. [Prerequisites](#prerequisites)
5. [How to Use](#how-to-use)
6. [Common Terraform Commands](#common-terraform-commands)
7. [Notes](#notes)

---

## Repository Structure

```
Terraform-AWS/
├── 01/
├── 02/
├── 03/
├── 04/
├── 05/
├── 06/
├── 07/
├── 08/
├── 09/
├── 10/
├── 11/
├── 12/
├── 14/
├── 15/
├── 16/
├── 17/
├── 18/
├── 19/
├── 20/
│   └── code/
├── 21/
├── 22/
├── 23/
├── 24/
│   └── code/
├── .gitignore
└── README.md
```

---

## How This Repo Is Organized

- Each numbered folder (`01` to `24`) is one step in the learning path, covering one topic or hands-on exercise.
- Folders `20` and `24` keep their Terraform files inside a `code/` subfolder.
- There is no folder `13`.
- `.gitignore` keeps local Terraform artifacts and sensitive files out of version control.

---

## Folder Details

> Fill in the **Topic** and **Key Files** columns for each folder.

| Folder | Topic | Key Files |
|:---:|---|---|
| [`01`](./01) | _e.g. Introduction / setup_ | |
| [`02`](./02) | | |
| [`03`](./03) | | |
| [`04`](./04) | | |
| [`05`](./05) | | |
| [`06`](./06) | | |
| [`07`](./07) | | |
| [`08`](./08) | | |
| [`09`](./09) | | |
| [`10`](./10) | | |
| [`11`](./11) | | |
| [`12`](./12) | | |
| [`14`](./14) | | |
| [`15`](./15) | | |
| [`16`](./16) | | |
| [`17`](./17) | | |
| [`18`](./18) | | |
| [`19`](./19) | | |
| [`20/code`](./20/code) | | |
| [`21`](./21) | | |
| [`22`](./22) | | |
| [`23`](./23) | | |
| [`24/code`](./24/code) | | |

### Per-folder template

Copy this block for each folder you want to describe in more detail:

```markdown
### 📁 01 - <Topic name>

**Goal:** What this folder demonstrates.

**Key files:**
- `main.tf` - resources defined
- `variables.tf` - input variables
- `outputs.tf` - output values

**AWS services used:** EC2, S3, ...

**What I learned:**
- Point 1
- Point 2

**Run it:**
terraform init && terraform plan && terraform apply
```

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured (`aws configure`)
- An AWS account with an IAM user or role that has the required permissions
- Git and VS Code (or any editor)

---

## How to Use

```bash
# 1. Clone the repository
git clone https://github.com/imVikash-ai/Terraform-AWS.git
cd Terraform-AWS

# 2. Go into any folder (use code/ inside 20 and 24)
cd 01

# 3. Initialize, review and apply
terraform init
terraform plan
terraform apply

# 4. Clean up to avoid AWS charges
terraform destroy
```

---

## Common Terraform Commands

| Command | Purpose |
|---|---|
| `terraform init` | Initialize the working directory and download providers |
| `terraform fmt` | Format configuration files |
| `terraform validate` | Check the configuration for errors |
| `terraform plan` | Preview the changes Terraform will make |
| `terraform apply` | Create or update infrastructure |
| `terraform destroy` | Tear down all managed infrastructure |
| `terraform state list` | List resources tracked in state |
| `terraform import` | Bring existing resources under Terraform management |

---

## Notes

- Always run `terraform destroy` after practice to avoid unexpected AWS costs.
- Never commit `*.tfstate`, `.terraform/`, or files containing credentials (see `.gitignore`).
- This repository is for learning, so configurations are meant for practice rather than production.