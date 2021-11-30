# github-pages-docker
This repository defines a Docker image that allows users to serve and build Jekyll/Github-Pages sites
for the ICLR blog track. 

Of particular note is `ghp_export.sh`. This implements our specific logic for hosting the submitters static site:
we generate a unique ID, concatenate a timestamp to it, and then replace the Jekyll URL inside the config folder by it.
