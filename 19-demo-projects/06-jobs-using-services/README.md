# Services
services are additional container, which run with your job, and within this container you can run databases. Whch can be used for testing jobs, code coverage jobs etc.,

Similar to job image containers, ```service``` containers within GitLab CICD are docker containers that provide a simple and portable way for you to host services. They provide specific resources and capabilities that your job might need during execution. A service can temporarly can spin up a MYSQL instance for your job. Like job containers. services run in their own environment which prevents interference with your main jobs.
* service images are specified using the ```service``` keyword. This additional image is used to create another container, which is available to first container. So that two containers have access to one another and can communicate when running the job.

```sh
unit_testing_job:
    tags:  
        - saas=linux-small-amd64
    image: node:20-alpine3.17
    services:
        - name: rakesh/mongo-db:dev
          alias: mongo
```

* This pipeline configuration specifies a job that runs all the steps within a node JS based image container. It utilizes The Linux GitLab  hosted runner as the Docker host for this container. Additionally, the job is configured with a service container with a custom MongoDB docker image and an s Mongo. When the pipeline is executed, it will run two containers. The job image and the service, docker containers run within the same user defined bridge network, all ports are exposed to each other.

# Available settings for ```services```
```name```    Full name of the image to use

```entrypoint```  Command or script to execute as the container’s entrypoint.

```command``` Command or script that should be used as the container’s command.

```alias```   Additional aliases to access the service from the job’s container.

```variables```   Additional environment variables that are passed exclusively to the service.

# ```services:docker```
Use ```services:docker``` to pass options to the Docker executor of a GitLab Runner.

```sh
arm-sql-job:
  script: echo "Run sql tests in service container"
  image: ruby:2.6
  services:
    - name: super/sql:experimental
      docker:
        platform: arm64/v8
        user: dave
```

# ```services:pull_policy```
The pull policy that the runner uses to fetch the Docker image. A single pull policy, or multiple pull policies in an array. Can be ```always```, ```if-not-present```, or ```never```.

```sh
job1:
  script: echo "A single pull policy."
  services:
    - name: postgres:11.6
      pull_policy: if-not-present

job2:
  script: echo "Multiple pull policies."
  services:
    - name: postgres:11.6
      pull_policy: [always, if-not-present]

```