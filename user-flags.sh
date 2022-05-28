#!/bin/bash

# echo $1
while getopts :u:a:f: flag; do 
    case "${flag}" in
        u) 
            username=$OPTARG
            ;;
        a)
            age=${OPTARG}
            ;;
        f) 
            fullname=${OPTARG}
            ;;
        \?) 
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done
echo "Username: $username";
echo "Age: $age";
echo "Full Name: $fullname";
exit 0
