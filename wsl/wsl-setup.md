# WSL Set Up

## Install Linux distribution and libraries

- Open the powershell and run the below command to see the list of Linux distribution available.

        wsl.exe -l -o

- To install the distribution, run the below command.

        wsl.exe --install -d Ubuntu-22.04

- Once the distribution is installed, setup with the username and password.
- Follow the steps given to setup DNS https://datawookie.dev/blog/2018/10/dns-on-ubuntu/

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

   - ```keytool -import -alias zScaler -keystore  "/home/rahul/.sdkman/candidates/java/17.0.9-amzn/lib/security/cacerts" -file pemfile.cer```
    

## Install Maven

- ```sdk list maven```
- ```sdk install maven 3.9.6``` 
- ```mvn --version```

## Install Gradle

- ```sdk list gradle```
- ```sdk install gradle 7.6.1```
- ```sdk install gradle 8.5```
- ```sdk use gradle 7.6.1```
- ```sdk default gradle 8.5```
- ```gradle --version```

## Install Python

To install and manage different versions of python, we will use the library pyenv https://github.com/pyenv/pyenv

- ```sudo apt install -y gcc make build-essential libssl-dev libffi-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev liblzma-dev```

- ```curl https://pyenv.run | bash```
- ```echo 'export PATH="/home/rahul/.pyenv/bin:$PATH"' >> ~/.bashrc```
- ```eval "$(pyenv init -)"```
- ```pyenv install -l | grep 3.10```
- ```pyenv install 3.10.1```
- ```pyenv install -l | grep 3.12```
- ```pyenv install 3.12.1```
- ```pyenv versions```
- ```pyenv global 3.12.1```

## Install Node

nvm is a version manager for node.js, designed to be installed per-user, and invoked per-shell. https://github.com/nvm-sh/nvm

- ```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash```
- ```command -v nvm```
- ```nvm ls```
- ```nvm ls-remote```
- ```nvm install v18.19.0```
- ```nvm install v20.10.0```
- ```nvm alias default v18.19.0```
- ```nvm use v20.10.0``` - current shell

## Install Go

Download the go binary from the location https://go.dev/dl/

- ```rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz```
- ```echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc```
- ```go version```

## Install kubectl

- ```curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"```
- ```sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl```
- ```kubectl version --client --output=yaml```
