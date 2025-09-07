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

In this section, we’ll take a closer look at the quality of three basecalling models: fast, hac, and sup. For this, we’ll use NanoPlot—a handy tool for checking the quality of long-read data.

NanoPlot provides many different metrics, but two of the most important are read length distribution and read quality.

Inside the folder `basecalled`, you’ll find three FASTQ datasets, each generated with one of these models. Let’s load them up and compare their quality side by side.

```bash
NanoPlot --fastq fast.fastq -o "nanoplot.fast" --no_static

NanoPlot --fastq hac.fastq -o "nanoplot.hac" --no_static

NanoPlot --fastq sup.fastq -o "nanoplot.sup" --no_static
```

What do you think? Is the wait for the better model to finish worth it to you?


