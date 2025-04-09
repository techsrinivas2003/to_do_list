# DevOps Intern Case Study: CI/CD with Containerization and Basic Infrastructure Automation

This project demonstrates the process of containerizing a TO-DO List Flask application, setting up a CI/CD pipeline for automated deployments, and managing infrastructure with Terraform.

## Features

- **Flask REST API Application**: A basic Flask application serving a REST API.
- **Containerization**: The application is containerized using Docker.
- **CI/CD Pipeline**: Automated pipeline using GitHub Actions to build, push, and deploy the Docker image.
- **Infrastructure as Code (IaC)**: Terraform scripts to manage VM creation and configure the environment.
- **Basic Monitoring**: Set up basic monitoring and alerting for the application.

## Project Structure

.
├── .github
│   └── workflows
│       └── ci-cd.yml             # GitHub Actions pipeline for CI/CD
├── app.py                        # Flask application code
├── requirements.txt              # Python dependencies
├── .gitignore                    # Git ignore file
├── terraform-iac                 # Terraform scripts for VM and infrastructure setup
├── tdlist.Dockerfile             # Dockerfile for containerizing the Flask app
└── templates                     # HTML templates for Flask


## Setup Instructions

### Prerequisites

- **Python 3.7+**
- **Docker** for containerization
- **GitHub Account** for CI/CD
- **Terraform** for infrastructure management
- **Docker Hub Account** (or other container registry)

### Steps to Run Locally

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/techsrinivas2003/to_do_list.git
    cd todo-list-flask
    ```

2. **Set up Virtual Environment**:
    ```bash
    python3 -m venv venv
    source venv/bin/activate   # On Windows use `venv\Scripts\activate`
    ```

3. **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Run Flask Application**:
    ```bash
    python app.py
    ```

5. Visit `http://127.0.0.1:5000` in your browser to use the application.

### Docker Setup

1. **Build Docker Image**:
    ```bash
    docker build -t your-dockerhub-username/todo-list-flask .
    ```

2. **Run Docker Container**:
    ```bash
    docker run -p 5000:5000 your-dockerhub-username/todo-list-flask
    ```

3. Visit `http://127.0.0.1:5000` to access the app running inside Docker.

4. **Push Docker Image to Docker Hub**:
    ```bash
    docker push your-dockerhub-username/todo-list-flask
    ```

### CI/CD Pipeline Setup (GitHub Actions)

The CI/CD pipeline is defined in `.github/workflows/ci-cd.yml`, and it performs the following steps:

1. **Build the Docker Image**
2. **Push the Image to Docker Hub**
3. **Deploy the Container to a VM** (configured by Terraform)

The pipeline automatically triggers on `push` events to the `main` branch or on pull requests.

### Infrastructure Setup with Terraform

The `terraform-iac/` folder contains basic Terraform scripts to:

1. **Launch a VM** for hosting the Flask application.
2. **Configure security groups** to allow HTTP and SSH traffic.
3. **Pull and Run the Docker Container** on the VM after deployment.

To run Terraform:

1. Initialize Terraform:
    ```bash
    terraform init
    ```

2. Apply the Terraform configuration:
    ```bash
    terraform apply
    ```

This will create the VM and configure it as needed.

### Monitoring and Alerts

Basic monitoring is set up to track:

- **CPU usage**: An alert will notify the team if CPU usage exceeds 70%. (This can be configured using external monitoring tools like Prometheus or CloudWatch.)

## Contributing

Feel free to fork this project, submit issues, and create pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.