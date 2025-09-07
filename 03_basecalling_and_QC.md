---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 9:15 – 9:35 Basecalling Models
- Available models: **hac**, **sup**, others  
- Example basecalling command (Metacentrum):

Following the live demo on basecalling, let's now get a better "feel" for the quality of the individual basecalling models. In order to QC nanopore reads, nanoplot is a convenient and versatile option. In the folder `basecalled`, you will find three basecalled fastq datasets, each basecalled with one of the models. Let's now compare their quality.

```bash
NanoPlot --fastq fast.fastq -o "nanoplot.fast"

NanoPlot --fastq hac.fastq -o "nanoplot.hac"

NanoPlot --fastq sup.fastq -o "nanoplot.sup"
```

What do you think? Is the wait for the better model to finish worth it to you?


