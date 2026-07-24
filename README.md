<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>


<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/OlsonTyler0/cloud-security-wazuh">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">ITC Cloud Security Wazuh Project</h3>

  <p align="center">
    This project was created in order to test the Wazuh security agent. Deploying the service and a single host.
    <br />
    <a href="https://github.com/OlsonTyler0/cloud-security-wazuh"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/OlsonTyler0/cloud-security-wazuh">View Demo</a>
    &middot;
    <a href="https://github.com/OlsonTyler0/cloud-security-wazuh/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/OlsonTyler0/cloud-security-wazuh/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project will deploy Wazuh, an open-source Extended Detection and Response (XDR) and SIEM platform, The central wazuh server will contain three separate containers: The Manager, Indexer, and Dashboard. Upon a successful setup, a penetration test will be conducted on a protected endpoint to demonstrate detections and prevention of cyber threats. 

Terraform code is a proof of concept and has not been tested in-depth. Vagrant was primarily utilized for the testing deployments. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

- Ansible
- Terraform

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

There are two things required to be done on proxmox prior to the use of terraform content.
- Provisioning of an API on a user scoped with the proper access to the portal.
- A valid ubuntu cloud init image on a host. 

#### API
More information about provisioning the API for proxmox can be found in the [Terraform Provider Documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)

#### Cloud init
Prior to installation an ubuntu Cloud init image is required. to understand how to get started. please see:
- [Telmate's Proxmox Provider Documentation "Cloud-init getting started"](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/guides/cloud-init%2520getting%2520started)



### Installation

1. Set up the above pre-requisites prior to running
2. Clone this repository
```sh
git clone https://github.com/OlsonTyler0/cloud-security-wazuh.git
```
3. Initialize terraform
```sh
terraform init
```
4. Allow ansible to bootstrap after and provision the host

If Manually running the playbooks:
```sh
git clone https://github.com/OlsonTyler0/cloud-security-wazuh.git
cd cloud-security-wazuh/ansible
ansible-galaxy install -r requirements.txt
ansible-playbook -i inventory.ini ./playbooks/wazuh.yml
ansible-playbook -i inventory.ini ./playbooks/webserver.yml
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

After installing you may access the wazuh server at the provided address by the script. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

Phase 0: Automation Phase
- [ ] Begin building the infrastructure as code automation starting with the development of terraform operations for proxmox. Due to the lack of API permissions, this will not end up being deployed and will be a simulation of the activity for other platforms. 
- [ ] Craft the deployment of the wazuh service via the use of ansible. 
- [ ] Craft a deployment of an example web server via the use of ansible.  

Phase 1: Deploy Phase
- [ ] Create virtual machines via automation. Create manually if unable to access proxmox with Terraform 
- [ ] Deploy automation to the production hosts. Monitor errors and fix as required. 

Phase 2: Validation Phasae

See the [open issues](https://github.com/OlsonTyler0/cloud-security-wazuh/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/OlsonTyler0/cloud-security-wazuh/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=OlsonTyler0/cloud-security-wazuh" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Tyler Olson - olsontyler@pm.me

Project Link: [https://github.com/OlsonTyler0/cloud-security-wazuh](https://github.com/OlsonTyler0/cloud-security-wazuh)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Proxmox Terraform Provider](https://registry.terraform.io/providers/Telmate/proxmox)
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/OlsonTyler0/cloud-security-wazuh.svg?style=for-the-badge
[contributors-url]: https://github.com/OlsonTyler0/cloud-security-wazuh/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/OlsonTyler0/cloud-security-wazuh.svg?style=for-the-badge
[forks-url]: https://github.com/OlsonTyler0/cloud-security-wazuh/network/members
[stars-shield]: https://img.shields.io/github/stars/OlsonTyler0/cloud-security-wazuh.svg?style=for-the-badge
[stars-url]: https://github.com/OlsonTyler0/cloud-security-wazuh/stargazers
[issues-shield]: https://img.shields.io/github/issues/OlsonTyler0/cloud-security-wazuh.svg?style=for-the-badge
[issues-url]: https://github.com/OlsonTyler0/cloud-security-wazuh/issues
[license-shield]: https://img.shields.io/github/license/OlsonTyler0/cloud-security-wazuh.svg?style=for-the-badge
[license-url]: https://github.com/OlsonTyler0/cloud-security-wazuh/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/tyler-s-olson
[product-screenshot]: images/screenshot.png
<!-- Shields.io badges. You can a comprehensive list with many more badges at: https://github.com/inttter/md-badges -->
