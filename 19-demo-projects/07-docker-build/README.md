# dependencies
Use the ```dependencies``` keyword to define a list of specific jobs to fetch artifacts from. The specified jobs must all be in earlier stages. You can also set a job to download no artifacts at all.

* An empty array ```([])```, to configure the job to not download any artifacts.

# Why do you need docker:24.0.5-dind as a service?
Docker-in-Docker (DinD) allows the job container to start its own Docker daemon. This is crucial when your job involves running Docker commands (such as ```docker build``` or ```docker images```), because:
* By default, Docker containers do not have their own Docker daemon.
* To run Docker commands inside a container, you need a running Docker daemon, which is provided by the ```docker:24.0.5-dind``` service.
* The ```docker:24.0.5-dind``` service will launch a separate Docker daemon inside the job container, enabling the job to interact with Docker (e.g., to build images or run containers).