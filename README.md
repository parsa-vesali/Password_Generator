# Password Generator

A simple Bash script that generates secure passwords and optionally saves them encrypted.

## Features
- Generate multiple passwords of user-defined length
- Securely encrypt passwords using `ccrypt`
- Easy to use in the terminal

## Requirements
- Bash
- OpenSSL
- ccrypt

Install ccrypt (Debian/Ubuntu):
```bash
sudo apt install ccrypt
chmod +x main.sh
./main.sh
