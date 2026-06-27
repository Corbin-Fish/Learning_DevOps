# Learning DevOps

### Intent:
The intent behind this repository is twofold
    - To demonstrate my knowledge and learning journey
    - To give others a sort of roadmap

### Methodology
I am using standard enterprise level tools and some less standard but exciting tooling to for my learning experience. I am using AI as a helper as a lot of the technical docs around some tools are messy and hard to understand.
(WARNING do not trust AI to do everything for you, It can and will ruin everything)

### Goals
My Goals are simple:
    - Setup my own CI / CD Pipeline using a self hosted runner
    - Use Ansible, Terraform, Cloud Compute
    - Mirror an Enterprise (Lite)
    - Deploy and validate apps using Docker

### Constraints
Because the runner is created on my host machine, I wont allow anyone to interact with it as a VM escape while unlikely is possible.

### Secrets
In order to make the repo easier to manage for myself and easier to read for you I have elected to use hard coded paths instead of passing secrets to the runner, though this is possible.

### Architecture
The Pipeline Follows a simple flow
    - Local Sanity check on the runner
    - Terraform provisons OCI instance
    - Ansible configures the remote instance
this separation of concerns mirrors real world teams

My PC > Github > Runner > OCI 

### Documentation
I described my setup of this architecture under the "docs" folder, this does describe how to do things but always follow the documentation from the vendor or a tutorial if you're just learning
I chose not to follow any tutorial that does not mean you shouldn't. I enjoy research and learning. 
If your goal is to get sped up as fast as possible you can mirror my steps 
    -Configure Self Hosted Runner
    -Configure OCI
    -Configure Ansible
    -Configure Terraform
    -Harden
    -Reconfigure Actions YAML
this will give you a strong baseline


