# COSC349 Assignment 2: Your Software in the Cloud
The purpose of this assignment was to deploy an application to the AWS cloud, making use of virtual machines and cloud services provided by AWS for COSC349, a cloud computing paper at the University of Otago.

The application that this project deploys is a simple online recipe book application that was developed for the first COSC349 assignment: https://github.com/matthewdockerty/cosc349-assignment1

## Dependencies
[Terraform](https://www.terraform.io/)

## Deploying to AWS
1. Place your AWS CLI credentials in the file ```~/.aws/credentials```
2. Set the environment variable ```TF_VAR_db_password``` (to be used as the password for the database)
3. Run ```terraform plan``` to view the deployment plan.
4. Run ```terraform apply``` to perform the deployment.

## Technologies Used
- Terraform
- AWS
   - ELB (classic load balancer)
   - EC2
   - DocumentDB


## License
This project is licensed under the MIT License

## Acknowledgments
- David Eyers - COSC349 lecturer
- Terraform Tutorials:
   - https://medium.com/@geekrodion/amazon-documentdb-and-aws-lambda-with-terraform-34a5d1061c15
   - https://www.bogotobogo.com/DevOps/Terraform/Terraform-VPC-Subnet-ELB-RouteTable-SecurityGroup-Apache-Server-1.php
