In GitLab CI/CD, a resource group is a feature that allows you to control the concurrency of jobs in your pipelines. This is particularly useful when you have jobs that should not run at the same time due to resource constraints or external dependencies.

If multiple jobs that belong to the same resource group are queued simultaneously, only one of the jobs starts. The other jobs wait until the resource_group is free.

# Unordered: 
This is the default process mode that limits the concurrency on running jobs.

* If the process mode is set to unordered:
deploy-1, deploy-2, and deploy-3 do not run concurrently.

# Oldest first: 
This process mode limits the concurrency of the jobs. When a resource is free, it picks the first job from the list of upcoming jobs (created, scheduled, or waiting_for_resource state) that are sorted by pipeline ID in ascending order.

* If the process mode is oldest_first:
deploy-1, deploy-2, and deploy-3 do not run concurrently.
deploy-1 runs first, deploy-2 runs second, and deploy-3 runs last.

# Newest first:
This process mode limits the concurrency of the jobs. When a resource is free, it picks the first job from the list of upcoming jobs (created, scheduled or waiting_for_resource state) that are sorted by pipeline ID in descending order.

* If the process mode is newest_first:
deploy-1, deploy-2, and deploy-3 do not run concurrently.
deploy-3 runs first, deploy-2 runs second and deploy-1 runs last.

# If three commits are pushed to the project in a short interval, that means that three pipelines run almost at the same time:

The first pipeline runs the jobs build -> deploy. Let’s call this deployment job deploy-1.

The second pipeline runs the jobs build -> deploy. Let’s call this deployment job deploy-2.

The third pipeline runs the jobs build -> deploy. Let’s call this deployment job deploy-3.

Depending on the process mode of the resource group:

* If the process mode is set to unordered:
deploy-1, deploy-2, and deploy-3 do not run concurrently.
There is no guarantee on the job execution order, for example, deploy-1 could run before or after deploy-3 runs.
* If the process mode is oldest_first:
deploy-1, deploy-2, and deploy-3 do not run concurrently.
deploy-1 runs first, deploy-2 runs second, and deploy-3 runs last.
* If the process mode is newest_first:
deploy-1, deploy-2, and deploy-3 do not run concurrently.
deploy-3 runs first, deploy-2 runs second and deploy-1 runs last.