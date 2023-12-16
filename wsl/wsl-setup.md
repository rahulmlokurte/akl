# WSL Set Up

## Install Linux distribution and libraries

- Open the powershell and run the below command to see the list of Linux distribution available.

        wsl.exe -l -o

- To install the distribution, run the below command.

        wsl.exe --install -d Ubuntu-22.04

- Once the distribution is installed, setup with the username and password.

- Run the below commands to setup few required libraries.

    -   ```sudo apt update && sudo apt upgrade```
    -   ```sudo apt-get install wget ca-certificates```
    -   ```sudo apt-get install wget ca-certificates zip unzip```

- If behind the corporate proxy, we need to put our pem file into the ca-certificate and update the certificates.

    -   ```/usr/local/share/ca-certificates/pemfile.crt```
    -   ```sudo update-ca-certificates```

