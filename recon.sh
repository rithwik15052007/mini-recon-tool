#!/bin/bash

# COLORS
BOLD='\033[1m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
NC='\033[0m'

mkdir -p reports logs
touch logs/activity.log

show_banner()
{
	sleep 0.3
	echo -e "${CYAN}"
	echo -e  "${BLUE}==========================${NC}"
    	echo -e  "     ${BOLD}${CYAN}MINI RECON TOOL   ${NC}"
    	echo -e  "${BLUE}==========================${NC}"
	echo -e "${NC}"
    	echo -e "${GREEN}[1]${NC} Ping Target"
    	echo -e "${GREEN}[2]${NC} DNS Lookup"
    	echo -e "${GREEN}[3]${NC} Whois Lookup"
    	echo -e "${GREEN}[4]${NC} Port Scan"
    	echo -e "${GREEN}[5]${NC} HTTP Header"
    	echo -e "${GREEN}[6]${NC} WhatWeb"
    	echo -e "${GREEN}[7]${NC} SSL Certificate Analysis"
    	echo -e "${GREEN}[8]${NC} Exit"
    	echo
}
	
log_header()
{
	echo  | tee -a "$report"
    	echo "========== $( date +"%Y-%m-%d  %H:%M:%S" ) ==========" | tee -a "$report"
}

write_log()
{
	echo "[$( date +"%Y-%m-%d  %H:%M:%S" )] $1"  >> "logs/activity.log"
}

validate_target()
{
    	ping -c 2 "$1" > /dev/null 2>&1
}

section_header()
{
    	echo
    	echo -e "${BLUE}====================================${NC}"
    	echo -e "${YELLOW}        $1${NC}"
    	echo -e "${BLUE}====================================${NC}"
    	echo
}

show_summary()
{
    	echo
    	echo -e  "${BLUE}==========================${NC}"
    	echo -e "${GREEN}Scan Completed Successfully${NC} "
    	echo -e  "${BLUE}==========================${NC}"
    	echo -e "${CYAN}Target : $1${NC}"
    	echo -e "${CYAN}Time   : $(date +"%Y-%m-%d %H:%M:%S")${NC}"
    	echo -e  "${BLUE}==========================${NC}"
    	echo
}

loading()
{
    	echo -ne "${MAGENTA}Processing${NC}"

    	for i in 1 2 3
    	do
        	echo -n "."
        	sleep 1
    	done

    	echo
}

check_tools()
{
	missing_tools=()
	tools=("curl" "host" "nmap" "openssl" "whatweb" "whois")

	echo 
	echo -e "${CYAN}Checking Environment...${NC}"
	echo 
	sleep 1	
	for tool in "${tools[@]}"
	do
		if  command -v "$tool" &> /dev/null
		then
			echo -e "${GREEN}[✓] $tool${NC}"
		else
			echo -e "${RED}[x] $tool${NC}"
			missing_tools+=("$tool")
		fi
	done
	if [ ${#missing_tools[@]} -ne 0 ]
	then
		echo
		echo -e "${RED}[-] Missing Required Tools :${NC}"
		for missing in "${missing_tools[@]}"
		do 
			echo -e "${YELLOW} ---> $missing${NC}"
		done
		
		echo
		echo -e "${CYAN}Install them using :${NC}"
		echo "sudo apt install ${missing_tools[*]}"
		
		exit 1
	fi
	echo 
	echo -e "${GREEN}[+] All Required Tools Found${NC}"

}

check_tools
sleep 1

while true
do
	show_banner

    	echo
    	read -p "Enter your choice : " ch
    	case $ch in

        	1)
            	read -p "Enter target (IP or domain): " tg
            	validate_target "$tg"
            	if [ $? -eq 0 ]
            	 then
                		report="reports/${tg}.txt"
                		log_header
                		echo
                		section_header "PING RESULTS"
                		echo -e "${YELLOW}[*] Pinging $tg ...${NC}"
                		loading
                		echo
                		ping -c 4 "$tg" | tee -a "$report"
                		echo
                		write_log "Ping scan performed on $tg."
                		echo -e "${GREEN}[+] Report saved to $report${NC}"
                		show_summary "$tg"
            	else
                		echo
                		echo -e "${RED}[-] Target unreachable or invalid!${NC}"
            	fi
            	;;

        	2)
            	read -p "Enter domain : " domain
            	report="reports/${domain}.txt"
                	log_header
                	echo
                	section_header "DNS RESULT"              
                	echo -e "${YELLOW}[*] Fetching DNS info for $domain ...${NC}"
                	loading
                	echo
                	if host "$domain" | tee -a "$report"
                	then
                		echo
                		write_log "DNS lookup performed on $domain."
                		echo -e "${GREEN}[+] Report saved to $report${NC}"
                		show_summary "$domain"
            	else
                		echo
                		echo -e "${RED}[-] Invalid or unreachable domain!${NC}"
            	fi
            	;;

        	3)
            	read -p "Enter domain : " domain
	            report="reports/${domain}.txt"
	            log_header
                	echo
                	section_header "WHOIS RESULTS"
                	echo -e "${YELLOW}[*] Fetching Whois info for $domain ...${NC}"
                	loading
                	echo
                	if whois "$domain" > /dev/null 2>&1
                	then
                		whois "$domain" | grep -E "Registrar:|Creation Date:|Registry Expiry Date:|Name Server:" | tee -a "$report"
                		write_log "Whois lookup performed on $domain."
	                	echo
	                	echo -e "${GREEN}[+] Report saved to $report${NC}"
	                	show_summary "$domain"
	            else
                		echo
                		echo -e "${RED}[-] Invalid or unreachable domain!${NC}"
            	fi
            	;;

        	4)
            	read -p "Enter target : " tg
                	report="reports/${tg}.txt"
	            log_header
	            echo
	            section_header "PORT SCAN RESULTS"
                	echo -e "${YELLOW}[*] Scanning open ports on $tg ...${NC}"
                	loading
                	echo
                	if nmap -sV "$tg" | tee -a "$report"
                	then	
                		echo
                		write_log "Port Scan performed on $tg."
                		echo -e "${GREEN}[+] Report saved to $report${NC}"
                		show_summary "$tg"
            	else
                		echo
                		echo -e "${RED}[-] Target unreachable or invalid!${NC}"
            	fi
            	;;

            5)
            	read -p "Enter URL (https://example.com) : " url
            	domain=$(echo "$url" | sed 's|https\?://||' | cut -d '/' -f1)
            	report="reports/${domain}.txt"
            	log_header
            	echo
            	section_header "HTTP HEADER"
            	echo -e "${YELLOW}[*] Fetching HTTP Header from $url ...${NC}"
            	loading
            	echo  
            	header=$(curl -I -L "$url" 2>/dev/null)
            	if [[ -n "$header" ]]
            	then	
            		echo "$header" >> "$report"
            		echo -e "${CYAN}Server Information : ${NC}"
            		echo "$header" | grep -i "^server:"
            		echo
            		echo -e "${CYAN}Content Information : ${NC}"
            		echo "$header" | grep -i "^content-type:"
            		echo
            		echo -e "${CYAN}Security Header : ${NC}"
            		echo "$header" | grep -Ei \
				"^strict-transport-security:|^x-frame-options:|^x-content-type-options:"
				echo
            		write_log "HTTP Header performed on $url."
            		echo -e "${GREEN}[+] Report saved to $report${NC}"
            		show_summary "$url"
            	else 
            		echo 
            		echo -e "${RED}[-] Failed to fetch headers!${NC}"
            	fi
            	;;

		6)
			
			read -p "Enter URL (https://example.com) : " url
		      domain=$(echo "$url" | sed 's|https\?://||' | cut -d '/' -f1)
    			report="reports/${domain}.txt"

    			log_header
    			echo
    			section_header "WHATWEB"
    			echo -e "${YELLOW}[*] Fetching Details from $url ...${NC}"
    			loading
    			echo

    			header=$(whatweb "$url" 2>/dev/null)

    			if [[ -n "$header" ]]
    			then
        			echo "$header" >> "$report"

        			section_header "TECHNOLOGY DETECTION"

        			ip=$(echo "$header" | grep -o 'IP\[[^]]*\]' | cut -d'[' -f2 | tr -d ']')
        			server=$(echo "$header" | grep -o 'HTTPServer\[[^]]*\]' | cut -d'[' -f2 | tr -d ']')
        			status=$(echo "$header" | grep -o '\[[0-9][0-9][0-9] [A-Z]*\]' | tr -d '[]')

        			echo -e "${CYAN}IP Address  : ${NC}${ip:-Not Detected}"
        			echo -e "${CYAN}Server      : ${NC}${server:-Not Detected}"
        			echo -e "${CYAN}HTTP Status : ${NC}${status:-Not Detected}"

        			echo
        			echo -e "${CYAN}Detected Technologies:${NC}"

        			echo "$header" | grep -oE 'HTML5|WordPress|Drupal|Joomla|Bootstrap|React|Angular|Vue.js|jQuery|PHP|ASP.NET|Apache|Nginx|Open-Graph-Protocol|OpenSearch|Strict-Transport-Security|X-Frame-Options'

        			echo
        			write_log "WhatWeb scan performed on $url"
        			echo -e "${GREEN}[+] Report saved to $report${NC}"
        			show_summary "$url"

    		else
        			echo
        			echo -e "${RED}[-] Failed to fetch details!${NC}"
    		fi
    		;;
		
        	7)
            	read -p "Enter URL (https://example.com) : " url
		      domain=$(echo "$url" | sed 's|https\?://||' | cut -d '/' -f1)
    			report="reports/${domain}.txt"

    			log_header
    			echo
    			section_header "SSL CERTIFICATE"
    			echo -e "${YELLOW}[*] Fetching Details from $url ...${NC}"
    			loading
    			echo

    			header=$(echo | openssl s_client -connect "$domain:443" 2>/dev/null | openssl x509 -noout -subject -issuer -dates)
    			if [[ -n "$header" ]]
    			then 
    				echo "$header" >> "$report"
				section_header "CERTIFICATE DETAILS"
				common_name=$(echo "$header" | grep "^subject=" | sed 's/^subject=//' | grep -o 'CN *= *[^,]*' | cut -d'=' -f2 | xargs)

    				issuer=$(echo "$header" | grep "^issuer=" | sed 's/^issuer=//' | grep -o 'CN *= *[^,]*' | cut -d'=' -f2 | xargs)

    				valid_from=$(echo "$header" | grep "^notBefore=" | cut -d'=' -f2)

    				expires_on=$(echo "$header" | grep "^notAfter=" | cut -d'=' -f2)

    				echo -e "${CYAN}Common Name : ${NC}${common_name:-Not Detected}"
    				echo -e "${CYAN}Issuer      : ${NC}${issuer:-Not Detected}"
    				echo -e "${CYAN}Valid From  : ${NC}${valid_from:-Not Detected}"
    				echo -e "${CYAN}Expires On  : ${NC}${expires_on:-Not Detected}"
    				echo 
    				write_log "SSL Certificate analysis performed on $url"
    				echo -e "${GREEN}[+] Report saved to $report${NC}"
    				show_summary "$url"
    			else
    				echo
    				echo -e "${RED}[-] Falied to fetch details!${NC}"
			fi
			;;
			
		8) 
			echo
			echo -e "${CYAN}Exiting Mini Recon Tool... 😎${NC}"
			exit 0
			;;

        	*)
            	echo
            	echo -e "${RED}[-] Invalid Choice!!!${NC}"
            	;;

	esac

done

			
