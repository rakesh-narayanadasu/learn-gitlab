# timeout
Use timeout to configure a timeout for a specific job. If the job runs for longer than the timeout, the job fails.

Possible inputs: A period of time written in natural language.

For example, these are all equivalent:
* 3600 seconds
* 60 minutes
* one hour

```sh

build:
  script: build.sh
  timeout: 3 hours 30 minutes

test:
  script: rspec
  timeout: 3h 30m

```