#!/bin/bash

read -p "Please enter the length of the password: " PASS_LENGTH

# Validate
if ! [[ $PASS_LENGTH =~ ^[0-9]+$ ]] || [ $PASS_LENGTH -le 0 ]; then
    echo "Error: Please enter a valid positive number."
    exit 1
fi

# Create Array
passwords=()

# Create 3 passwords
for p in {1..3}; do
    passwords+=("$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)")
done

# Display generated passwords
echo "Here are the generated passwords: "
for password in "${passwords[@]}"; do
    echo "$password"
done

# Ask user if they want to save the passwords to a file
read -p "Do you want to save these passwords to a file? (y/n) " choice

if [[ "${choice,,}" = "y" ]]; then
    read -s -p "Enter passphrase to encrypt file: " PASSPHRASE
    echo
    for password in "${passwords[@]}"; do
        echo "$password" | ccrypt -e -K "$PASSPHRASE" >> "passwords.txt.cpt"
    done
    echo "Passwords saved securely to passwords.txt.cpt"
else
    echo "Passwords not saved."
fi
