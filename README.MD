# Project 4

## Part 1 

1. To install Docker I had to first follow the instructions here to     install node: https://nodejs.org/en/download/
    I then grabbed docker from here: https://docs.docker.com/get-started/get-docker/

    I verified that Docker was running on my system by running docker info

2. To run the container I ran docker run -p 4200:4200 bruk02/myers-ceg3120. -p sets the port with the first being the host port and the second being the container port. The last option is the image.
Angular CLI (command line interface) is needed to be installed, then to run you need the ng serve --host 0.0.0.0.

- I validated this from inside the container by running docker exec -it <8c1c380a2196> (My container ID) curl http://4200
While outside (my PC) I just went to a web browser and typed http://localhost:4200 and saw the giant bird.

3. FROM tells us the base (node:18-bullseye)
   - WORKDIR /app tells us the working directory
   - COPY the files from the angular folder into the container
   - Install Angular CLI and all project dependencies
   - EXPOSE the port we want it to be on
   - CMD (runs the angular dev server)
   - I validated this the same way, connected from outside from browser and ran docker exec -it <8c1c380a2196> (My container ID) curl http://4200 which printed the raw html

4. I created a public repo by going here: https://hub.docker.com/repositories/bruk02 and click create a repo
   - I generated a PAT by going here and generating a new token: https://app.docker.com/settings/personal-access-tokens/ I made this a read write delete as I am the only one working on this task and I wanted full control incase something went wrong, I also need write to push the image.

   - I pushed the image by running this command:  docker run -p 4200:4200 bruk02/myers-ceg3120

   - Here my dockerhub link: https://hub.docker.com/repository/docker/bruk02/myers-ceg3120/general

   


## Part 2

1. I created my access token at the same URL above, but I did just read and write. As my actions wont be deleting anything, but need to be able to push. My secrets are my username and my PAT, I need both in order to push without my login info.

2. My workflow checks out my code from github, logins into dockerhub (using the secrets I provided) builds the docker image using my dockerfile and then pushes the new image to my dockerhub repo.

- Context, file, branches, and secrets are all variables of sorts. My dockerfile may not be in root, or the branch I want to use could very well be not main. Also what my secrets are named are the most subject to change. As a secret may expire, or anything else may occur.

- LINK TO FILE: https://github.com/WSU-kduncan/ceg3120-cicd-Bruk04/blob/main/.github/workflows/docker-build.yml

3. - I can know that the actions did its tasking by checking here: https://github.com/WSU-kduncan/ceg3120-cicd-Bruk04/actions
I initally got errors here but when viewing them it seems I typed CEG3120 instead of ceg3120. Fixing this gave me a green checkmark
   - To test, I ran docker pull bruk02/myers-ceg3120 then ran it with the same docker run command and amde sure it still worked.


## Part 3

1. The goal of this project was really deploy code autonomously. If you look at the project in a broader sense, I have made changes on my local machine, then pushed those changes to github, and had those changes onto 'live' (docker where my stuff is deployed) synchronously. I did this using Docker (where my content is deployed), and github (the source of my content) and github actions (what to do with my content).

2. Online resources:
- https://nodejs.org/en/download/
- https://docs.docker.com/engine/daemon/troubleshoot (docker issues)
- https://docs.docker.com/build/ci/github-actions/ (How to use github actions & docker)
- https://docs.github.com/en/actions/use-cases-and-examples/deploying/deploying-with-github-actions (general info on github actions)

