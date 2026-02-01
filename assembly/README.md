# T2T Genome Assembly workshop


## 🧬 8:30 – 8:45 Important workshop information

### **HOW TO LOGIN TO THE COMPUTERS IN A219**  
Everyone will use the same guest account, with the same username and password.  
*guest00*  
*fibioinfo26*  

- Welcome & overview  
- Collect questions

### SET UP YOUR WORKING DIRECTORIES IN YOUR HOME FOLDER
Commands here can be copied into a terminal (bash command line prompt, more specifically). Everything after a # symbol is considered a comment by bash and has no effect on the command preceding it.

```bash
# return to your home directory (the tilde is actually optional and you may replace it by a path to set up shop elsewhere)
cd ~
# Download the repository with instructions and input data
git clone https://github.com/bioinf-fi/workshops.git
```
Inside the directory tree (explore it using the ls command) you will find a directory called assembly for today's workshop. There is also assembly/workspace, a subdirectory where you will work and save all your output and intermediate files.

### OPEN A WEB BROWSER TO POINT YOU TO IMPORTANT RESOURCES
Initially, you will need to point your browser to two resources, the workshop github pages (one is the same content you copied to a local directory with GIT above):

`firefox https://github.com/bioinf-fi/workshops &`

another one describes the software contents of the container image we are going to use below and some hints on how the software can be used:

`firefox https://github.com/bioinf-fi/docker &`

There is also a working directory to watch, which at this point will be empty:

`firefox file:///mnt/data/guest00/workshops/assembly/workspace/ &`

Note: Omit the firefox command and use just the URL if not running web browser from the command line.

### OBTAIN THE DOCKER IMAGE WITH INSTALLED TOOLS

#### Option A: Import from pre-built image file (*USE THIS* ON THE COMPUTERS IN A219)

Run the pre-built and pre-loaded image file:

  ```bash
  cd $HOME # same as cd ~
  cd workshops/assembly/workspace
  ./run.sh start
  # if a specific image name is needed pass it as an --image arg:
  ./run.sh start --image genome-assembly
  ```

#### Option B: Build from source (7-10m) (*SKIP* THIS IF ON THE COMPUTERS IN A219)

```bash
cd ~
git clone https://github.com/bioinf-fi/docker.git
cd docker/assembly
make build ENGINE=podman # or explicitly: podman build --load -t localhost/genome-assembly:latest -f assembly.Dockerfile . 
```

# 👩‍🏫 Workshop Lecturers and Teaching Assistants

We are excited to introduce teachers who will be supporting the workshop.  

---

## 1. Monika Cechova
<img src="assets/cechova.png" alt="Monika Cechova" width="200">

- 🎓 Assistant Professor at the Faculty of Informatics

---

## 2. Matej Lexa
<img src="assets/lexa.jpeg" alt="Matej Lexa" width="200">

- 🎓 Associate Professor at the Faculty of Informatics

---

## 3. Oliver Purnoch
<img src="assets/purnoch.jpeg" alt="Oliver Purnoch" width="200">

- 🎓 BS Student at the Faculty of Informatics

---
## 4. Hana Boháčová
<img src="assets/bohacova.jpeg" alt="Hana Bohacova" width="200">

- 🎓 MS Student at the Faculty of Informatics

---

## 📌 Note
Teachers will be available anytime during the workshop, as well as during the coffee break
