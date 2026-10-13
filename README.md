# Terraform-AWS

A hands-on learning journey through **Terraform on AWS**, from the first `terraform init` to production-style, highly available architectures. Each topic pairs a concept with a practical demo or mini project.

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?logo=amazonaws&logoColor=white)
![IaC](https://img.shields.io/badge/Infrastructure_as_Code-blue)

---

## The Big Picture

**Infrastructure as Code (IaC)** means describing your infrastructure in files instead of clicking through a console. Those files are versioned in Git, reviewed like application code, and can recreate the same environment any number of times.

**Terraform** is a tool that reads those files and makes AWS match them.

```
 You write .tf files  ──►  Terraform compares  ──►  Calls AWS APIs  ──►  Real infrastructure
   (desired state)         with state file         (via AWS provider)      (actual state)
```

Everything in Terraform follows one idea: **declare the end result, and Terraform works out the steps.**

### Why IaC?

| Benefit | What it means |
|---------|---------------|
| Consistency | Dev, staging and prod are built from the same code |
| Speed | Hours of manual work become one command |
| Version control | Every infra change is tracked in Git |
| Fewer mistakes | No manual configuration drift |
| Cost control | Easy cleanup with `terraform destroy` |
| Collaboration | Teams review and share infrastructure like code |

## Core Concepts

| Concept | Intuition |
|---------|-----------|
| **Provider** | A plugin that lets Terraform talk to a platform (here, `hashicorp/aws`) |
| **Resource** | One thing to create, such as a VPC, an EC2 instance or an S3 bucket |
| **State file** | Terraform's memory of what it has actually built (`terraform.tfstate`) |
| **Plan** | A preview of what will change, before anything happens |
| **Variables / Locals / Outputs** | Inputs, computed values and results: the "function interface" of your config |
| **Data source** | Read information about existing infrastructure instead of creating it |
| **Module** | A reusable package of resources |
| **Backend** | Where state is stored; remote backends enable teamwork and locking |

## The Terraform Workflow

```
init ──► validate ──► plan ──► apply ──► destroy
```

| Command | Purpose |
|---------|---------|
| `terraform init` | Download providers and set up the backend |
| `terraform validate` | Check the configuration for errors |
| `terraform plan` | Preview the changes |
| `terraform apply` | Create or update the infrastructure |
| `terraform destroy` | Tear everything down |

## Repository Structure

Each numbered folder is one lesson or project, in the order they were learned.

```
Terraform-AWS/
├── 01 ... 12/        # Foundations, state, variables, language features, data sources
├── 14 ... 19/        # Mini projects: S3 website, VPC peering, IAM, Beanstalk, Lambda, provisioners
├── 20/code/          # EKS cluster
├── 21/ 22/ 23/       # Governance, RDS, S3 security monitoring
├── 24/code/          # Highly available Django app on AWS
├── .gitignore
└── README.md
```

> There is no folder `13`.

## Learning Path

Folders `01` to `12` cover Parts 1 to 4 below, in order. Folders `14` to `24` are the mini projects in Part 5.

### Part 1: Foundations
- Introduction to IaC and Terraform
- Providers and version constraints (`~> 5.0`, `>= 1.2`, and so on)
- AWS authentication (CLI, environment variables, IAM roles, profiles)
- Your first resource: an S3 bucket

### Part 2: State Management
- What the state file is and why it matters
- **Remote backend** on S3 with versioning and encryption
- **S3 native state locking** (`use_lockfile = true`, Terraform 1.10+), which replaces DynamoDB locking
- State commands: `list`, `show`, `rm`, `mv`, `pull`

### Part 3: Writing Better Configuration
- Input, local and output variables, and **variable precedence** (CLI > `tfvars` > environment variables > defaults)
- Organizing code into files (`backend.tf`, `provider.tf`, `variables.tf`, `main.tf`, `outputs.tf`, and so on)
- Type constraints and best practices

### Part 4: Advanced Language Features
- **Meta-arguments:** `count`, `for_each`, `depends_on`
- **Lifecycle rules:** `create_before_destroy`, `prevent_destroy`, `ignore_changes`
- **Dynamic blocks, conditional expressions and splat expressions**
- **Built-in functions:** string, numeric, collection and more
- **Data sources:** reading existing AWS resources
- **Provisioners:** what they are, when to use them, and why they are a last resort

### Part 5: Mini Projects

| Folder | Project | What you learn |
|--------|---------|----------------|
| [`14`](./14) | **Static website hosting** | S3 website hosting and public access |
| [`15`](./15) | **VPC peering** | Connecting two VPCs across regions and testing private connectivity |
| [`16`](./16) | **IAM user management** | Users, groups, memberships and passwords at scale |
| [`17`](./17) | **Elastic Beanstalk blue-green deployment** | Zero-downtime releases with environment swaps and rollback |
| [`18`](./18) | **Serverless image processor** | S3 events, Lambda and generating image variants |
| [`19`](./19) | **Provisioners demo** | `local-exec`, `remote-exec`, `file` and connection blocks |
| [`20`](./20/code) | **EKS cluster** | Managed Kubernetes with node groups and add-ons |
| [`21`](./21) | **Policy and governance** | IAM policies and AWS Config rules for compliance |
| [`22`](./22) | **RDS database** | A modular VPC, EC2 and MySQL RDS stack with a Flask app |
| [`23`](./23) | **S3 security monitoring** | CloudTrail, CloudWatch metric filters, alarms and SNS email alerts |
| [`24`](./24/code) | **Highly available infrastructure** | Multi-AZ VPC, ALB, Auto Scaling group and a containerized Django app |

## Capstone Architecture (Project 24)

```
Internet ──► ALB (public subnets) ──► EC2 Auto Scaling Group (private subnets) ──► NAT Gateways ──► Internet
                                              │
                                      Django app in Docker
```

- VPC across **2 Availability Zones**, with public and private subnets
- **Auto Scaling:** minimum 1, desired 2, maximum 5 instances based on CPU
- **Security:** instances are private and reachable only through the load balancer
- **No single point of failure:** one NAT gateway per AZ

## Recommended Project Layout

```
project-root/
├── backend.tf           # Remote state configuration
├── provider.tf          # Provider and version constraints
├── variables.tf         # Input variables
├── locals.tf            # Computed values
├── main.tf              # Core resources
├── vpc.tf               # Networking
├── security.tf          # Security groups
├── compute.tf           # EC2 / ASG
├── storage.tf           # S3 / EBS
├── database.tf          # RDS
├── outputs.tf           # Outputs
├── terraform.tfvars     # Variable values (do not commit secrets)
└── modules/             # Reusable modules
```

> Terraform loads every `.tf` file in a directory and merges them, so file names are only for organization.

## Getting Started

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/install) 1.10 or newer (needed for S3 native locking)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), configured with credentials
- An AWS account with permissions for the services you use

### Run a project

```bash
git clone https://github.com/imVikash-ai/Terraform-AWS.git
cd Terraform-AWS/24/code      # or any other folder

aws configure          # one-time credential setup

terraform init
terraform validate
terraform plan
terraform apply

terraform destroy      # always clean up when finished
```

### Clone only one project

```bash
git clone --filter=blob:none --no-checkout https://github.com/imVikash-ai/Terraform-AWS.git
cd Terraform-AWS
git sparse-checkout set 24      # example: only the HA project
git checkout main
```

## Best Practices Covered

1. Always pin provider versions
2. Store state remotely, with locking, encryption and versioning
3. Never edit the state file by hand
4. Use separate state per environment
5. Run `terraform plan` before every `apply`
6. Keep secrets out of Git (use sensitive variables or a secrets manager)
7. Prefer data sources, modules and native resources over provisioners
8. Destroy practice resources when done to avoid AWS charges

## Important Notes

- **Costs:** NAT gateways, EKS, RDS and load balancers are billed hourly. Destroy them after practice.
- **Names:** S3 bucket names are globally unique, so most demos add a random suffix.
- **Regions:** make sure your provider region matches where you want to deploy.
- **Secrets:** never commit `terraform.tfstate`, `.tfvars` files with passwords, or AWS keys.

## Troubleshooting

| Problem | Likely fix |
|---------|-----------|
| Authentication errors | Re-run `aws configure` and check the region |
| State lock error | Run `terraform force-unlock <lock-id>` after a crashed run |
| Backend lock not working | Confirm S3 versioning is on and Terraform is 1.10 or newer |
| Bucket name already exists | Choose a globally unique name or add a random suffix |
| Resource stuck or dependent | Check `depends_on` and the destroy order |

## Author

**Vikash** — [@imVikash-ai](https://github.com/imVikash-ai)

---

*If this repo helped you, consider giving it a star.*