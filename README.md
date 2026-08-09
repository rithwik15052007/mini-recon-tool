<div align="center">

# Mini Recon Tool

![Bash](https://img.shields.io/badge/Bash-Scripting-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/Linux-Terminal-black?style=for-the-badge&logo=linux)
![Nmap](https://img.shields.io/badge/Nmap-Network%20Scanner-blue?style=for-the-badge)
![Cyber Security](https://img.shields.io/badge/Cyber-Security-red?style=for-the-badge)
![Recon Tool](https://img.shields.io/badge/Type-Reconnaissance-purple?style=for-the-badge)
![CLI Tool](https://img.shields.io/badge/Interface-CLI-informational?style=for-the-badge)
![Made With](https://img.shields.io/badge/Made%20With-Bash-orange?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Kali%20Linux-blueviolet?style=for-the-badge&logo=kalilinux)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-Educational-orange?style=for-the-badge)

**A Bash-based reconnaissance tool designed to perform basic network and web reconnaissance tasks through a simple menu-driven interface. The tool automates information gathering for domains and hosts while generating detailed reports and maintaining activity logs.**

</div>

---

# Features

- ICMP Ping Testing
- DNS Resolution
- Reverse DNS Lookup
- WHOIS Lookup
- Port Scanning using Nmap
- HTTP Header Analysis
- Security Header Analysis
- Technology Detection using WhatWeb
- SSL Certificate Analysis
- Traceroute
- Subdomain Enumeration
- Colorized Terminal Output
- Automatic Report Generation
- Activity Logging
- Tool Dependency Checking

---

# Project Structure

```text
mini-recon-tool/
│
├── recon.sh
├── reports/
├── logs/
│   └── activity.log
└── README.md
```

---

# Requirements

Ensure the following tools are installed before running the project:

- Bash
- curl
- dnsutils
- whois
- nmap
- whatweb
- openssl
- traceroute
- assetfinder

### Install Required Packages

```bash
sudo apt update

sudo apt install curl dnsutils whois nmap whatweb openssl traceroute assetfinder
```

---

# Platform Support

| Platform | Support | Notes |
|----------|---------|-------|
| Linux | Fully Supported | Developed and tested on Kali Linux. |
| macOS | Compatible | Requires Bash and required dependencies. |
| Windows | Compatible | Use WSL or Git Bash with required dependencies. |

> **Note:** The project is primarily developed and tested on Kali Linux. Compatibility on other platforms depends on the availability of required tools.

---

# Installation

### Clone the repository

```bash
git clone https://github.com/rithwiklabs/mini-recon-tool.git
```

### Navigate to the project directory

```bash
cd mini-recon-tool
```

### Give execute permission

```bash
chmod +x recon.sh
```

### Run the tool

```bash
./recon.sh
```

---

# Output

The tool automatically creates organized output.

- Scan reports are stored inside the **reports/** directory.
- Execution logs are stored in **logs/activity.log**.

---

# Learning Objectives

This project demonstrates practical usage of:

- Bash Scripting
- Linux Command-Line Utilities
- Networking Fundamentals
- DNS & Reverse DNS Enumeration
- WHOIS Enumeration
- Port Scanning with Nmap
- HTTP Header Analysis
- Security Header Analysis
- SSL/TLS Certificate Inspection
- Web Technology Fingerprinting (WhatWeb)
- Traceroute
- Subdomain Enumeration
- Shell Script Automation
- Report Generation & Logging

---

# Issues

If you encounter a bug, unexpected behavior, installation problem, or compatibility issue, please open an **Issue** in the GitHub repository.

When reporting an issue, try to include:

- Operating system and version
- Error message or terminal output
- Recon Tool version
- Steps to reproduce the issue
- Relevant screenshots, if applicable

Please avoid sharing sensitive information such as private IP addresses, credentials, API keys, or access tokens.

---

# Contributing

Contributions are welcome! 

If you would like to improve the Mini Recon Tool:

1. Fork the repository.
2. Create a new branch.

```bash
git checkout -b feature/your-feature
```

3. Make your changes.
4. Test the changes thoroughly.
5. Commit your changes.

```bash
git commit -m "Add: your feature description"
```

6. Push the branch.

```bash
git push origin feature/your-feature
```

7. Open a **Pull Request** describing your changes.

### Contribution Guidelines

- Keep the Bash code clean and readable.
- Follow the existing project structure and coding style.
- Test new functionality before submitting a Pull Request.
- Avoid introducing unnecessary dependencies.
- Update the README when adding or changing features.
- Ensure changes are intended for legitimate and authorized security testing.

---

# Future Improvements

Potential enhancements for future versions:

- Parallel Scanning
- Banner Grabbing
- Service Version Detection
- Operating System Detection
- HTML/PDF Report Export
- Interactive Dashboard
- Multi-target Scanning
- Vulnerability Detection using Nmap NSE Scripts

---

# Disclaimer

This project is developed **strictly for educational and ethical purposes**.

- Use this tool **only** on systems you own or have explicit authorization to test.
- Unauthorized scanning may violate local laws or organizational policies.
- The author assumes **no responsibility** for misuse of this software.

---

<div align="center">

# Author

### **M Rithwik Kumar**

**B.Tech Computer Science (Cyber Security)**

If you found this project helpful, consider giving it a ⭐ on GitHub!

</div>
