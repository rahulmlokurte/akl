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

## Install Java

We will use SDKMAN to handle multiple java versions.

- Install SDKMAN

    - ```curl -s "https://get.sdkman.io" | bash```
    - ```source "/home/rahul/.sdkman/bin/sdkman-init.sh"```
    - ```sdk version```

- Install Java 11 and 17

    - ```sdk install java 11.0.21-amzn``` 
    - ```sdk install java 17.0.9-amzn```

- To choose a given version in the current terminal

    - ```sdk use java 17.0.9-amzn```

- To Choose to make a given version the default:

    - ```sdk default java 17.0.9-amzn```
    
- To see what is currently in use

    - ```sdk current java```

- To see the absolute path where SDK resides

    - ```sdk home java 11.0.21-amzn```
    - ```sdk home java 17.0.9-amzn```

- If we are behind a corporate firewall, we can import the security using keytool.

   - ```keytool -import -alias zScaler -keystore  "/home/rahul/.sdkman/candidates/java/17.0.9-amzn" -file pemfile.cer```
    

