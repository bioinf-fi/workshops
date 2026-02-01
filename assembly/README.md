# T2T Genome Assembly workshop

## 🧬 8:30 – 8:50 Important workshop information and Introduction

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
  cd ~/workshops/assembly
  workspace/run.sh start
  # if a specific image name is needed pass it as an --image arg:
  workspace/run.sh start --image localhost/genome-assembly
  ```

#### Option B: Build from source (7-10m) (*SKIP* THIS IF ON THE COMPUTERS IN A219)

```bash
cd ~
git clone https://github.com/bioinf-fi/docker.git
cd docker/assembly
make build ENGINE=podman # or explicitly: podman build --load -t localhost/genome-assembly:latest -f assembly.Dockerfile . 
```

### Download Resources (or make sure you have them already)

```bash
cd ~/workshops/assembly/datasets
# 5.6 GB
wget -O assembly.Exercise8.fa https://public.gi.ucsc.edu/~mcechova/teaching/assembly.Exercise8.fa
# 150 MB
wget -O mystery.fasta https://is.muni.cz/el/fi/podzim2025/PV269/um/mystery/mystery.fasta
# 936 MB
wget -O chm13.fa.gz https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz
# 23 MB
wget -O chr11-2M.fa.gz https://github.com/chhylp123/hifiasm/releases/download/v0.7/chr11-2M.fa.gz
# 118 MB
wget -O hifi.fastq.gz https://obj.umiacs.umd.edu/sergek/shared/ecoli_hifi_subset24x.fastq.gz
# 244 MB
wget -O ont.fastq.gz https://obj.umiacs.umd.edu/sergek/shared/ecoli_ont_subset50x.fastq.gz
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

## 5. Honza Kotrs

<img src="assets/kotrs.png" alt="Honza Kotrs" width="200">

- 🎓 PhD Student at the Faculty of Informatics

---

## Big thank you to Martin Klimeš from <unix@fi.muni.cz>

- 🎓 Technical support (guest accounts, docker image, filesystem)
