## Running your own local cluster

1. Make use of installation steps first
2. Run

```
    ./setup-local-cluster.sh   
    kubectl apply -f test-deployment.yaml  
    curl https://localhost/foo  
    # If you add foo.dev to your /etc/hosts under 127.0.0.1 then you can do:  
    curl https://foo.dev  
```

## Installation for Linux/macOS/Windows

``Important! Before installing, upgrade your local docker to newest version``

### 1. Install [kind](https://kind.sigs.k8s.io/docs/user/quick-start#installation) for chosen OS, to run the cluster on your local machine

**On Linux:**

    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind

**On macOS via Homebrew:**

    brew install kind

**On macOS via Bash:**

```
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-darwin-amd64
    chmod +x ./kind
    mv ./kind /usr/local/bin/kind
```   

**On Windows:**

```
    curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.11.1/kind-windows-amd64
    Move-Item .\kind-windows-amd64.exe c:\some-dir-in-your-PATH\kind.exe
```

### 2. Install [ctlptl](https://github.com/tilt-dev/ctlptl#how-do-i-install-it), to configure Local Kubernetes Cluster with Docker Registry

**On Linux**

```   
   CTLPTL_VERSION="0.5.7"
   curl -fsSL https://github.com/tilt-dev/ctlptl/releases/download/v$CTLPTL_VERSION/ctlptl.$CTLPTL_VERSION.linux.x86_64.tar.gz | sudo tar -xzv -C /usr/local/bin ctlptl
```

**On macOS via Homebrew:**

```
   brew install tilt-dev/tap/ctlptl
```   

**On macOS via Bash:**

```
   CTLPTL_VERSION="0.5.7"
   curl -fsSL https://github.com/tilt-dev/ctlptl/releases/download/v$CTLPTL_VERSION/ctlptl.$CTLPTL_VERSION.mac.x86_64.tar.gz | sudo tar -xzv -C /usr/local/bin ctlptl
```

**On Windows:**

```
   scoop bucket add tilt-dev https://github.com/tilt-dev/scoop-bucket
   scoop install ctlptl
```

### 3. Install [kubectl](https://kubernetes.io/docs/tasks/tools/) for calling Cluster API

**On Linux**

```   
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

**On macOS via Homebrew:**

```
   brew install kubectl 
```

**On Windows:**

```
   curl -LO "https://dl.k8s.io/release/v1.22.0/bin/windows/amd64/kubectl.exe"
   Add the binary in to your PATH
```

### 4. Install Helm [Helm](https://helm.sh/docs/intro/install/) for configuring the applications

**On Linux**

```   
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
```

**On macOS via Homebrew:**

```
   brew install helm
```

**On Windows:**

```
   choco install kubernetes-helm
```

### 5. Install [mkcert](https://github.com/FiloSottile/mkcert) to generate trusted local certificates

**On Linux**

```   
    sudo apt install libnss3-tools -
    wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
    sudo cp mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
    sudo chmod +x /usr/local/bin/mkcert
    mkcert -install
    mkcert -key-file=key.pem -cert-file=cert.pem dev foo.dev bar.dev localhost
```

**On macOS via Homebrew:**

```
   brew install mkcert 
   brew install nss # if you use Firefox
   mkcert -install
   mkcert -key-file=key.pem -cert-file=cert.pem dev *.dev localhost
```

**On Windows:**

```
   choco install mkcert
   mkcert -install
   mkcert -key-file=key.pem -cert-file=cert.pem dev '*.dev' localhost
```

### 5. Create Cluster and Registry

```
./setup-local-cluster.sh
```