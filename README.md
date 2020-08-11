# ML Development Environment

A fully fledged development environment for OSX, Windows, Linux

Step - 1: Install docker 

You need docker! Check out https://docs.docker.com/get-docker/ on information on how to install docker for your system.


Step - 2: NVIDIA docker runtime (not needed if you don't want to use GPUs)

If you have NVIDIA drivers installed, you need the NVIDIA runtime to use GPUs in the development environment.
Run the following commands if you are on Ubuntu to set up the NVIDIA runtimes.

```
# Add the package repositories
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

For more information about the NVIDIA docker runtime, take a look here: https://github.com/NVIDIA/nvidia-docker

Step - 3: Build the container

```
make build
```

Step - 4: Start the coding environment

```
WORKSPACE=[PATH_TO_YOUR_CODEBASE] CPORT=[PORT] make code
```

Where ```PATH_TO_YOUR_CODEBASE``` is the path to your code base where all the scripts/notebooks are located and ```PORT``` is the port you want to run the IDE on

e.g. ```WORKSPACE=/home/abhishek/workspace/bert-sentiment CPORT=10012 make code```

Step - 5: Open the URL in broswer

```http://127.0.0.1:10012/```

And have fun coding!
