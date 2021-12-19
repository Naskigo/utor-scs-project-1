## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Diagrams/Network_Topology_ELK.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

- [Install_elk.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_elk.yml)
- [Install_filebeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_filebeat.yml)
- [Install_metricbeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_metricbeat.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting in-bound access to the network.
- Load balancers plays a crucial role in cybersecurity. A load balancer's ability to manage flow of information between the server and endpoint device (PC, laptop, cellphone etc...) provides a security function that defends against distributed denial-of-service (DDoS) attacks.

- The advantage of a jump box is that it is a hardened and monitored device that spans two different security zones which provides a secured means of access between them. Admins first connect to the jump box before conducting administrative tasks within the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- What does Filebeat watch for? Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- What does Metricbeat record? Metricbeat is a lightweight shipper to periodically collect metrics from the operating system and from services running on the server. In this configuration, metricbeat takes the metrics and statistics that it collects and ships them to Elasticsearch or Logstash.

The configuration details of each machine may be found below.

| Name                 | Function       | IP Address                | Operating System |
|----------------------|----------------|---------------------------|------------------|
| Jump Box Provisioner | Gateway        | 10.0.0.4 / 20.120.109.234 | Linux            |
| Web-1                | DVWA Web Server| 10.0.0.5                  | Linux            |
| Web-2                | DVWA Web Server| 10.0.0.6                  | Linux            |
| ELK Server           | ELK Server     | 10.1.0.4 / 20.110.178.7   | Linux            |
| Load Balancer        | Load Balancer  | 13.82.123.165             | Linux            |
| Workstation          | Access Control | Public IP                 | Windows          |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Workstation Public IP via TCP on port 5601.

Machines within the network can only be accessed by the ansible container on the jump box provisioner using SSH keys. 
Which machine did you allow to access your ELK VM? What was its IP address?
- Workstation Public IP via TCP on port 5601
- Jump Box Provisioner IP: 10.0.0.4 via SSH keys on port 22

A summary of the access policies in place can be found in the table below.

| Name                 	| Publicly Accessible 	| Allowed IP Addresses                	|
|----------------------	|---------------------	|-------------------------------------	|
| Jump Box Provisioner 	| No                  	| Workstation Public IP (SSH port 22) 	|
| Web-1                	| No                  	| 10.0.0.4 (SSH port 22)              	|
| Web-2                	| No                  	| 10.0.0.4 (SSH port 22)              	|
| ELK Server           	| No                  	| Workstation Public IP (port 5601)   	|
| Load Balancer        	| No                  	| Workstation Public IP (HTTP port 80) 	|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because 
-Using Ansible to automate configurations ensures that the provisioning of all YMAL scripts run identically everywhere. This also ensures that automated configurations will do exactly the same thing every time they run helping eliminate as much variability between configurations as possible.

The ELK playbook implements the following tasks:
- Installs docker.io: The Docker engine, used for running containers.
- Installs python3-pip: Package used to install Python software.
- Installs Docker module: Python client for Docker. Required by Ansible to control the state of Docker containers. 
- Configures the target VM to use the appropriate memory to allow the ELK container to efficiently run.
- Downloads and launches a docker elk container with the appropriate port mappings.
- Enables service docker on boot so that if you restart your ELK VM, the docker service start up automatically.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Diagrams/docker_ps_output.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name   	| IP Addresses 	|
|--------	|--------------	|
| Web-1  	| 10.0.0.5     	|
| Web-2  	| 10.0.0.6     	|


We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: This deployment configuration enabled the filebeat system module to collect and parse logs created by the system logging service on Web-1 and Web-2 VMs.
- Metricbeat: This deployment configuration enabled the metricbeat docker module to collect metrics from Docker containers. The default metricsets are: container, cpu, diskio, healthcheck, info, memory and network.


### Using the Playbooks
- [Install_elk.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_elk.yml)
- [Install_filebeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_filebeat.yml)
- [Install_metricbeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_metricbeat.yml)

In order to use a playbook, you will need to have an Ansible control node already configured. Our control node was an Ansible container running on our jump box provisioner. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

### Instructions for using ELK playbook

Copy the install_elk.yml file to /etc/ansible/roles/

```
curl -o /etc/ansible/roles/install_elk.yml https://github.com/Naskigo/utor-virt-cyber-project-1/blob/99b4c08f62610c6030ef281e76025e7857b2e576/Ansible/install_elk.yml
```
- Update the ansible hosts file to include the ELK group and private IP so that Ansible can discover and connect to it when attempting to configure your target machine. 
To explicitly configure a Python 3 interpreter, set the ansible_python_interpreter inventory variable in the hosts file to the location of a Python 3 interpreter, such as /usr/bin/python3. The default interpreter path may also be set in ansible.cfg.

```
nano /etc/ansible/hosts
```
```
[elk]
10.1.0.4 ansible_python_interpreter=/usr/bin/python3
```
Before running your elk playbook you will need to update install_elk.yml file to tell Ansible which machine to configure.

```
---
- name: installing and launching elk
  hosts: elk
  become: yes 
```
Run the install_elk.yml playbook
```
ansible-playbook /etc/ansible/roles/install_elk.yml
```
Navigate to http://[your_elk_server_public_ip]:5601/app/kibana to check that the installation worked as expected. If you can not connect, verify that your network security group/firewall rules allow connections from your Workstation Public IP via TCP on port 5601.

### Instructions for using beat playbooks

If you wish to install filebeat and metricbeat on the DVWA VMs, follow these steps: 

- Copy the install_filebeat.yml and install_elk.yml files to /etc/ansible/roles/

```
Filebeat
curl -o /etc/ansible/roles/filebeat.yml https://github.com/Naskigo/utor-virt-cyber-project-1/blob/321c2e991e0fbd4b5ab9584c0e816f502cd514b0/Ansible/install_filebeat.yml
```
```
Metricbeat
curl -o /etc/ansible/roles/metricbeat.yml https://github.com/Naskigo/utor-virt-cyber-project-1/blob/321c2e991e0fbd4b5ab9584c0e816f502cd514b0/Ansible/install_metricbeat.yml
```

- Copy the filebeat-config.yml and metricbeat-config.yml files to /etc/ansible/files

```
curl -o /etc/ansible/files/metricbeat-config.yml https://github.com/Naskigo/utor-virt-cyber-project-1/blob/4a09a7a796c0dce481bd0f3612895d6782712ef6/Ansible/metricbeat-config.yml
```

- Next you need to specify in the ansible container hosts file a different host name containing the DVWA servers IP addresses.

```
nano /etc/ansible/hosts
```
```
[webservers]
10.0.0.5 ansible_python_interpreter=/usr/bin/python3
10.0.0.6 ansible_python_interpreter=/usr/bin/python3

[elk]
10.1.0.4 ansible_python_interpreter=/usr/bin/python3
```

Before running your beat playbooks you will need to update the install_filebeat.yml and install_metricbeat.yml files to correctly specify the hosts name to tell Ansible which machine to configure.

- [Install_filebeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_filebeat.yml)
```
---
- name: installing and launching filebeat
  hosts: webservers
  become: yes 
```
- [Install_metricbeat.yml](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Ansible/install_metricbeat.yml)
```
---
- name: installing and launching metricbeat
  hosts: webservers
  become: yes 
```

Next, run the playbooks 
```
$ ansible-playbook /etc/ansible/roles/install_filebeat.yml
```
```
$ ansible-playbook /etc/ansible/roles/install_metricbeat.yml
```
- Lastly, navigate to http://[your_elk_server_public_ip]:5601/app/kibana to check that the installations worked as expected. 

![alt text](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Diagrams/Kibana_Home_Page.jpg)

For Filebeat Status
```
-- Click on Add Log Data
-- Choose System Logs
-- Navigate to step 5: Module status and click Check Data
```
![alt text](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Diagrams/Filebeat%20Module%20status%20confirmed.jpg)

For Metricbeat Status
```
-- Click on Add Log Data
-- Choose Docker metrics
-- Navigate to step 5: Module status and click Check Data
```
![alt text](https://github.com/Naskigo/utor-scs-project-1/blob/42ea4e5d76bac29491e44683ac472d94497c68fd/Diagrams/Metricbeat_module_status_confirmed.jpg)

### Additional Resources : 
- [Filebeat Documentation](https://www.elastic.co/guide/en/beats/filebeat/current/index.html)
- [Metricbeat Documentation](https://www.elastic.co/guide/en/beats/metricbeat/current/index.html)
- [ELK Documenation](https://www.elastic.co/guide/index.html)
- [Ansible `pip` Module](https://docs.ansible.com/ansible/latest/modules/pip_module.html#pip-module)
- [Ansible `docker_container` Module](https://docs.ansible.com/ansible/latest/modules/docker_container_module.html#docker-container-module)
- [Ansible `command` Module](https://docs.ansible.com/ansible/latest/modules/command_module.html#command-module)

