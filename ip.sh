#!/bin/bash
# widhisec
cyan='\033[0;36m'
green='\e[92m'
merah='\033[0;31m'
hijau="\e[92m"
putih="\e[97m"
lAnGsUnGpOsT_PoT(){
            i=0
            for i in $(seq 1 "$x"); do
                local gas=$(curl -H "Accept: application/json" \
                "https://leakix.net/search?page=$i&q=$ba&scope=leak" -Ss|jq .'[].ip'|grep -Eo "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
                printf '%s\n' "${gas}"|sort -u
                touch $inputFile
                echo -e "$gas"|uniq >> $inputFile
            done

}
sending_(){
            for x in $(cat $inputFile);do
             local z=$(curl -sL "https://sonar.omnisint.io/reverse/${x}"   \
             -H "origin: https://omnisint.io" \
             -H "referer: https://omnisint.io/"  --compressed|jq .[]|sed s/\"//g)
             if [[ $z =~ "null" ]];
             then
                echo -e "${merah}[!] ${putih}err"
            else 
                echo -e "${cyan}[MANTAP] ${putih}DAPAT "
                echo -e "$z" >> $inputFile.pwn
              fi
              done
}
echo -ne "${cyan}[+]masukkan ${putih}namafile : "; read inputFile
echo -ne "${hijau}site${putih}: "; read ba
echo -ne "page: "; read x
lAnGsUnGpOsT_PoT
sending_
