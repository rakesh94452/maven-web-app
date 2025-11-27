#  Project Setup using DevOps Tools (Jenkins + Docker + Kubernetes)

---

##  Tools Used

* **Maven** – Build Tool
* **GitHub** – Source Code Management (SCM)
* **Jenkins** – CI/CD Tool
* **Docker** – Containerization
* **Kubernetes** – Container Orchestration

---

##  Step-1 : Jenkins Server Setup in Linux VM

### 🔹 Create Jenkins Server

* Launch **Ubuntu VM** using AWS EC2 (**t2.medium**)
* Enable **8080 port** in Security Group Inbound Rules

### 🔹 Connect to VM

Use MobaXterm or SSH:

```
ssh -i your-key.pem ubuntu@<PUBLIC-IP>
```

### 🔹 Install Java

```
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version
```

### 🔹 Install Jenkins

```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins -y
```

### 🔹 Start Jenkins

```
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

### 🔹 Access Jenkins

Open browser:

```
http://<PUBLIC-IP>:8080
```

Get Admin Password:

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Create Admin User & Install Required Plugins.

---

##  Step-2 : Configure Maven in Jenkins

Go to:

```
Manage Jenkins → Tools → Maven Installation → Add Maven
```

Provide name:

```
Maven-3.9.9
```

---

##  Step-3 : Setup Docker in Jenkins

```
curl -fsSL https://get.docker.com | /bin/bash
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo systemctl restart jenkins
sudo docker version
```

---

##  Step-4 : Create Jenkins Job / Pipeline

### 📌 Pipeline Stages

1. Clone Git Repository
2. Maven Build
3. Create Docker Image
4. Run Docker Container
5. Kubernetes Deployment

---

##  Step-5 : Kubernetes Setup

### 🔹 Install kubectl

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version
```

### 🔹 Install Minikube (Local Kubernetes)

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
```

---

##  Step-6 : Trigger Jenkins Job

Click **Build Now** in Jenkins to start the pipeline.

---

##  Step-7 : Enable Host Port

Add application port (e.g., 8081 / 3000 / 80) in AWS Security Group inbound rules.

---

##  Step-8 : Access Application

Open in browser:

```
http://<PUBLIC-IP>:<PORT>/
```

We should be able to access our deployed application successfully.

---

##  Step-9 : Cleanup (Very Important)

After practice, delete AWS resources to avoid unnecessary billing:

* EC2 Instances
* Load Balancers
* Security Groups
* EKS / Minikube resources

