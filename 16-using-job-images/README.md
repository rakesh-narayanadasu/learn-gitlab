# image
Use image to specify a Docker image that the job runs in.

You can use it only as part of a job level  (only that job uses) or in the default section (all jobs uses same image).

# Possible inputs: 

The name of the image, including the registry path if needed, in one of these formats:

```sh
<image-name> (Same as using <image-name> with the latest tag)
<image-name>:<tag>
<image-name>@<digest>
```