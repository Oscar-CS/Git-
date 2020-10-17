#!/bin/bash

function scan () {

    first_ip=$1
    size_first_ip=${#first_ip}
    default=192.168.0.
    size_default=${#default}
    final_ip=$2
    size_final_ip=${#final_ip}
    
    if [ $size_first_ip -eq 0 ]
    then
        echo "IP desconocida!"
        
    elif [ $size_first_ip -gt $size_default ] && [ $size_first_ip -lt 15 ]
    then
 	read -p 'Puerto inferior para la primera IP: ' first
    	read -p 'Puerto superior para la primera IP: ' last
        ip=$first_ip
        for (( i=$first; i<=$last; i++)) 
            do
                (echo > /dev/tcp/$ip/$i) > /dev/null 2>&1 && echo -e "\nLa IP $ip tiene el puerto $i abierto\n"
            done
        
        if [ $size_final_ip -eq 0 ]
            then
            	echo "Segunda IP desconocida!"
            	    
        elif [ $size_final_ip -gt $size_default ] && [ $size_final_ip -lt 15 ]
    	then
    	    read -p 'Puerto inferior para la segunda IP: ' first
    	    read -p 'Puerto superior para la segunda IP: ' last
            for (( i=$first; i<=$last; i++)) 
                    do
                        (echo > /dev/tcp/$final_ip/$i) > /dev/null 2>&1 && echo -e "\nLa IP $final_ip tiene el puerto $i abierto"
                    done
                    
            echo -e "\nIPs Activas En Rango de $first_ip "-" $final_ip.\n"
            nmap $first_ip"-"$final_ip
            
	elif [ $size_final_ip -lt $size_default ]
        then
            read -p 'Puerto inferior para la segunda IP: ' first
    	    read -p 'Puerto superior para la segunda IP: ' last
    	    ip="$default$final_ip"
            for (( i=$first; i<=$last; i++)) 
                do
                    (echo > /dev/tcp/$ip/$i) > /dev/null 2>&1 && echo -e "\nLa IP $ip tiene el puerto $i abierto"
                done  
        
        echo -e "\nIPs Activas En Rango $first_ip "-" $ip.\n"
        nmap $first_ip-$final_ip
            
        else
            echo "Segunda IP inválida"
        fi
    else
        echo "Primera IP inválida"
    fi
}

scan $1 $2
