# ASTERRA DevOps Assignment – August 2025

## 📌 Project Overview

This project fulfills the requirements of the ASTERRA DevOps assignment, which includes building a complete AWS-based infrastructure using Terraform, deploying a Python Flask API in Docker, managing cloud storage and databases, and automating the flow of data between AWS services.

---

## 📐 Project Architecture

### ✅ Services Used:
- **AWS EC2**: For running a Dockerized Flask application.
- **AWS S3**: To store and retrieve `.geojson` files.
- **AWS RDS (PostgreSQL with PostGIS)**: To store geo-data in a relational format.
- **IAM Roles**: For granting EC2 instances access to S3 and RDS.
- **Terraform**: For infrastructure as code.
- **Docker**: For containerizing the Flask application.
- **Git & GitHub**: Version control and repository management.

---

## ⚙️ Infrastructure Components (Terraform)

The `terraform/` directory contains:

- `main.tf`: Defines all AWS resources (VPC, Subnets, EC2, RDS, S3, IAM, etc.)
- `variables.tf`: Input variables used in the configuration.
- `terraform.tfvars`: Actual values for the input variables (not pushed to GitHub).
- `outputs.tf`: Outputs like public IP, S3 bucket name, RDS endpoint.
- `userdata.sh`: Optional startup script.
- `.terraform.lock.hcl`: Terraform provider lock file.

### 🔐 Security:
- EC2 accessible via SSH with a key pair (`liam-oshri`).
- S3 and RDS access granted to EC2 via IAM Role and Instance Profile.

---

## 🐍 Flask Application

The `flask-app/` folder contains:

- `app.py`: Flask application that accepts a `.geojson` filename and loads it from S3 into the RDS (PostgreSQL) as a JSONB.
- `requirements.txt`: Python dependencies (`boto3`, `psycopg2-binary`, `flask`).
- `Dockerfile`: Builds a container with the Flask API.
- `example.geojson`: Example file to test the API.
- `.env`: Used to pass runtime environment variables to the Docker container (**not committed to GitHub**).

---

## 🚀 API Endpoint

### **POST /process**

Reads a `.geojson` file from S3 and inserts it into a table in RDS as JSONB.

**Example Request:**
```bash
curl -X POST http://<EC2_PUBLIC_IP>:5000/process \
  -H "Content-Type: application/json" \
  -d '{"filename": "example.geojson"}'
Successful Response:

json
Copy
Edit
{
  "message": "example.geojson inserted into DB",
  "status": "success"
}
🧪 Test Flow
Upload the .geojson file to your S3 bucket:

bash
Copy
Edit
aws s3 cp example.geojson s3://asterra-assignment-bucket/
SSH into the EC2 instance:

bash
Copy
Edit
ssh -i ~/.ssh/liam-oshri ec2-user@<EC2_PUBLIC_IP>
Navigate to the app folder and run:

bash
Copy
Edit
cd ~/flask-app/
docker build -t flask-geojson-app .
docker run -d --env-file .env -p 5000:5000 flask-geojson-app
From your local machine, call the /process endpoint (as above).

Verify the data was inserted into RDS.

📦 Deployment Summary
Component	Value
EC2 IP	44.216.178.86
RDS Endpoint	asterra-assignment-db.cc7g8i6a21tg.us-east-1.rds.amazonaws.com
S3 Bucket	asterra-assignment-bucket
VPC ID	vpc-0c53c238a1c3a8e97

🧼 .gitignore Highlights
The following are ignored from version control:

.env

*.tfstate, .terraform/

__pycache__/

.vscode/, .idea/

terraform.tfvars

This ensures that sensitive data and unnecessary files are not committed.

📁 Project Structure
css
Copy
Edit
asterra-assignment/
├── flask-app/
│   ├── app.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── example.geojson
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars (ignored)
│   └── userdata.sh
├── .gitignore
└── README.md
✅ Final Notes
All components were deployed, tested, and verified.

The entire flow from S3 → Flask (Docker) → RDS is functional.

Infrastructure is reproducible using Terraform.

Source code: GitHub Repo

yaml
Copy
Edit

---

ברגע שאתה מדביק את זה ל־`README.md` ורוצה להעלות – תריץ:

```bash
git add README.md
git commit -m "finalized clean README"
git push origin main