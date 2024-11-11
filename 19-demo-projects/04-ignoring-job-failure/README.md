# allow_failure
Use ```allow_failure``` to determine whether a pipeline should continue running when a job fails.

* To let the pipeline continue running subsequent jobs, use ```allow_failure: true```.
* To stop the pipeline from running subsequent jobs, use ```allow_failure: false``` (default).

```sh
job2:
  stage: test
  script:
    - execute_script_2
  allow_failure: true
```

# allow_failure:exit_codes
Use ```allow_failure:exit_codes``` to control when a job should be allowed to fail. The job is ```allow_failure: true``` for any of the listed exit codes, and allow_failure false for any other exit code.

Possible inputs:
* A single exit code.
* An array of exit codes.

```sh
test_job_1:
  script:
    - echo "Run a script that results in exit code 1. This job fails."
    - exit 1
  allow_failure:
    exit_codes: 137

test_job_2:
  script:
    - echo "Run a script that results in exit code 137. This job is allowed to fail."
    - exit 137
  allow_failure:
    exit_codes:
      - 137
      - 255
```