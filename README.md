# Learning DevOps

### Intent
The intent behind this repository is twofold:
- To demonstrate my knowledge and learning journey  
- To give others a sort of roadmap

### Methodology
I am using standard enterprise-level tools and some less standard but exciting tooling for my learning experience. I am using AI as a helper as a lot of the technical docs around some tools are messy and hard to understand.  
**(WARNING: do not trust AI to do everything for you — it can and will ruin everything.)**

### Goals
My goals are simple:
- Set up my own CI/CD pipeline using a self‑hosted runner  
- Use Ansible, Terraform, Cloud Compute  
- Mirror an Enterprise (Lite)  
- Deploy and validate apps using Docker  

### Constraints
Because the runner is created on my host machine, I won’t allow anyone to interact with it, as a VM escape — while unlikely — is possible.

### Secrets
To make the repo easier to manage for myself and easier to read for you, I have elected to use hard‑coded paths instead of passing secrets to the runner, though this is possible.

### Architecture
The pipeline follows a simple flow:
- Local sanity check on the runner  
- Terraform provisions OCI instance  
- Ansible configures the remote instance  

This separation of concerns mirrors real‑world teams.

**My PC → GitHub → Runner → OCI**

### Documentation
I described my setup of this architecture under the `docs` folder. This does describe how to do things, but always follow the documentation from the vendor or a tutorial if you're just learning.

I chose not to follow any tutorial — that does not mean you shouldn’t. I enjoy research and learning.

If your goal is to get sped up as fast as possible, you can mirror my steps:
- Configure self‑hosted runner  
- Configure OCI  
- Configure Ansible  
- Configure Terraform  
- Harden  
- Reconfigure Actions YAML  

This will give you a strong baseline.

