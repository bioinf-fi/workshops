# T2T Genome Assembly workshop


## 🧬 8:30 – 8:45 Important workshop information

### **HOW TO LOGIN TO THE COMPUTERS IN A219**  
Everyone will use the same guest account, with the same username and password.  
*guest00*  
*fibioinfo26*  

- Welcome & overview  
- Collect questions  

### **OBTAIN THE DOCKER IMAGE WITH INSTALLED TOOLS**

**Option A: Build from source (7-10m) (*SKIP* THIS IF ON THE COMPUTERS IN A219)**

```bash
git clone git@github.com:bioinf-fi/docker.git
cd docker/assembly
make build ENGINE=podman # or explicitly: podman build --load -t bioinf-fi/assembly:latest -f assembly.Dockerfile . 
```

**Option B: Import from pre-built image file (*USE THIS* ON THE COMPUTERS IN A219)** 

**Run the pre-built image file**

  ```bash
  cd $HOME
  cd workshop
  podman run -it --rm --user $(id -u):$(id -g) -v "$PWD:/data:Z,U" bioinf-fi/assembly:latest bash
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
