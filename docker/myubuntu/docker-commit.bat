:: "Usage:  docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]"
:: "Create a new image from a container's changes"
:: "Options:"
::   "-a, --author string    Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")"
::   "-c, --change list      Apply Dockerfile instruction to the created image"
::   "-m, --message string   Commit message"
::   "-p, --pause            Pause container during commit (default true)"

set CONTAINER=j11s22k33-ubuntu
set IMAGE=j11s22k33/ubuntu
set TAG=latest

docker commit %CONTAINER% %IMAGE%:%TAG%