# Project 4



## Part 1 

1. To install Docker I had to first follow the instructions here to     install node: https://nodejs.org/en/download/
    I then grabbed docker from here: https://docs.docker.com/get-started/get-docker/

    I verified that Docker was running on my system by running docker info

2. To run the container I ran docker run -p 4200:4200 bruk02/myers-ceg3120. -p sets the port with the first being the host port and the second being the container port. The last option is the image.
Angular CLI (command line interface) is needed to be installed, then to run you need the ng serve --host 0.0.0.0.

I validated this from inside the container by running docker exec -it <8c1c380a2196> (My container ID) curl http://4200

While outside (my PC) I just went to a web browser and typed http://localhost:4200 and saw the giant bird.

3. FROM tells us the base (node:18-bullseye)
   WORKDIR /app tells us the working directory
   COPY the files from the angular folder into the container
   Install Angular CLI and all project dependencies
   EXPOSE the port we want it to be on
   CMD (runs the angular dev server)
   I validated this the same way, connected from outside from browser and ran docker exec -it <8c1c380a2196> (My container ID) curl http://4200 which printed the raw html

4. I created a public repo by going here: https://hub.docker.com/repositories/bruk02 and click create a repo
   I generated a PAT by going here and generating a new token: https://app.docker.com/settings/personal-access-tokens/ I made this a read write delete as I am the only one working on this task and I wanted full control incase something went wrong, I also need write to push the image.
   I pushed the image by running this command:  docker run -p 4200:4200 bruk02/myers-ceg3120
   Here my dockerhub link: https://hub.docker.com/repository/docker/bruk02/myers-ceg3120/general

   


## Part 2

1. I created my access token at the same URL above, but I did just read and write. As my actions wont be deleting anything, but need to be able to push. My secrets are my username and my PAT, I need both in order to push without my login info.

2. My workflow checks out my code from github, logins into dockerhub (using the secrets I provided) builds the docker image using my dockerfile and then pushes the new image to my dockerhub repo. Context, file, branches, and secrets are all variables of sorts. My dockerfile may not be in root, or the branch I want to use could very well be not main. Also what my secrets are named are the most subject to change. As a secret may expire, or anything else may occur.
LINK TO FILE:

2. 
   - AMI selected: Ubuntu
   - Instance type selected: t2.micro
   - keypair selected myers-vpc-keypair

   need to select keypair in order to have instance aware which private key to expect.

3. Under network settings, used dropdown to select previously made MYERS-subnet so that I am in charge/aware of what IPs are within 
my subnet


4. I selected to not auto assign an IPV4 since I will be tying my previously made EIP to the instance, this can be done by going to EIP then clicking associate then choosing with instance


5. Under configure storage. You can add new volume. Where you can select differnt types of storage. For instance, an SSD instead of 
an HDD. These choices could be important if processing time is a factor (SSD is faster) as we get 30 free. I added 8 gp3 SSD


6. At the very top of the page you can tag a name. There I typed in MYERS-instance


7. Under the Network settings section, under the firewall section. I chose select existing security group. And chose MYERS-sg. This, 
like the subnet, allows my instance to use the security group built for my VPC for this instance.


8. Under the Network & Security tab on the left I clicked Elastic IP address. After creation I right clicked it and selected 
Associate Elastic IP adress. Clicked instance, and then chose my instance


![details1](./images/instancedetails1.png)

![details2](./images/instancedetails2.png)


## Part 3 - Instance Configuration

1. To SSH into the instance I ran the following command ssh -i myers-vpc-keypair.pem ubuntu@35.169.112.79
35... is the elastic ip of the machine and the .pem is my private key to access the instance

3. To edit it I ran sudo nano /etc/hostname and then changed it to MYERS
then did it again in sudo nano /etc/hosts and changed it there to match MYERS. Then restarted.


NOTE: proj1-images also contains all screenshots found here if links are broken.
