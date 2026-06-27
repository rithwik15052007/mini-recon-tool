# Mini Recon Tool

![Bash](https://img.shields.io/badge/Bash-Scripting-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/Linux-Terminal-black?style=for-the-badge&logo=linux)
![Nmap](https://img.shields.io/badge/Nmap-Network%20Scanner-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Active-success?style=for-the-badge)
![Cyber Security](https://img.shields.io/badge/Cyber-Security-red?style=for-the-badge)
![Recon Tool](https://img.shields.io/badge/Type-Reconnaissance-purple?style=for-the-badge)
![CLI Tool](https://img.shields.io/badge/Interface-CLI-informational?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-Educational-orange?style=for-the-badge)

A Bash-based reconnaissance tool designed to perform basic network and web reconnaissance tasks from the command line. It provides a simple menu-driven interface for gathering useful information about domains and hosts while automatically generating reports and maintaining activity logs.
---

## Features

- ICMP Ping Testing
- DNS Information Lookup
- WHOIS Enumeration
- Port Scanning using Nmap
- HTTP Header Analysis
- Technology Detection using WhatWeb
- SSL Certificate Analysis
- Colorized Terminal Output
- Report Generation
- Activity Logging
- Tool Dependency Checking

---

## Project Structure

```text
recon-tool/
│
├── recon.sh
├── reports/
├── logs/
└── README.md

```

---

## Requirements

Make sure the following tools are installed:

- bash
- curl
- dnsutils
- whois
- nmap
- whatweb
- openssl

Install required packages:

sudo apt update
sudo apt install curl whois dnsutils whois nmap whatweb openssl

---

## Installation

Clone the repository: git clone https://github.com/rithwiklabs/mini-recon-tool.git

Navigate into the project directory: cd recon-tool

Give execute permission: chmod +x recon.sh

Run the tool: ./recon.sh
---

## Output
- Scan reports are saved inside the reports/ directory
- Activity logs are stored in logs/activity.log

---

## Learning Objectives

This project helps in learning:

- Bash scripting
- Linux Command-Line Utilities
- Networking basics
- DNS & WHOIS Enumeration
- Port Scanning
- HTTP Header Analysis
- SSL/TLS Certificate Inspection
- Web Technology Fingerprinting
- Shell Script Automation


---

## Future Improvements

- Subdomain Enumeration
- Security Header Analysis
- Reverse DNS Lookup
- Traceroute
- Parallel Scanning
---

## Disclaimer

This project is intended strictly for educational and ethical purposes.

- Use only on systems you own or have explicit authorization to test.
- Unauthorized scanning may violate laws or organizational policies.
- The author is not responsible for any misuse of this tool.

Unauthorized scanning may be illegal.

---
	
## Author

M Rithwik Kumar
