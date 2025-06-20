🌐 AWS 3-Tier Architecture with Terraform


Hello! 👋
This project showcases my practical approach to designing and deploying real-world cloud infrastructure that is scalable, secure, and well-architected. Using Terraform, I implemented a production-style 3-tier architecture on AWS, applying best practices I’ve carefully studied, tested, and refined.


🏗️ Architecture Overview


    Custom VPC with public and private subnets across multiple availability zones

    EC2 Instances hosting a React frontend and Node.js backend, deployed across separate layers

    Aurora MySQL Cluster in a private subnet for durability and fault tolerance

    IAM Roles, Security Groups, and Route Tables to enforce least-privilege access and traffic control

    Terraform modules and remote state management with S3 and DynamoDB for safe collaboration

    Bash scripting and variable configuration for clean, reusable environments

The infrastructure is designed with reliability, security, and cost control in mind, no hardcoded secrets, no manual provisioning.


🚧 Current Development


The infrastructure is fully deployed. Ongoing enhancements include:

    PM2 process manager for zero-downtime Node.js backend restarts

    Secure file uploads to S3 using pre-signed URLs and scoped IAM permissions
    

🤔 Project Goals


This build explores what goes into a real-world cloud deployment beyond just “getting it working.” It focuses on:

    Applying the AWS Well-Architected Framework

    Creating repeatable, modular Terraform code

    Building with fault tolerance, identity management, and scalability in mind

    Exploring principles of separation of concerns across web, app, and database tiers
    

🧠 Future Improvements


If scaling this up further, areas of improvement would include:

    Multi-region failover support

    Latency-based routing with Route 53

    CI/CD integration with GitHub Actions or CodePipeline

    Advanced monitoring using CloudWatch dashboards and X-Ray tracing
    

🔧 Tech Stack


| Category       | Tools & Services                              |
| -------------- | --------------------------------------------- |
| Cloud Provider | AWS (EC2, S3, RDS, IAM, VPC, CloudWatch)      |
| IaC            | Terraform (modular structure, remote backend) |
| OS             | Amazon Linux 2                                |
| Frontend       | React (served from EC2 behind ALB)            |
| Backend        | Node.js (PM2-managed)                         |
| Database       | Aurora MySQL (Multi-AZ)                       |
| Security       | IAM Roles, Security Groups, S3 Policies       |
| Cost Awareness | AWS Budgets + CloudWatch Alarms               |




