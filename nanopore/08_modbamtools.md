---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 11:30 – 11:50 Modbamtools
Visualization and clustering:

Modbamtools is a toolkit designed to visualize and analyze DNA methylation data stored in the BAM format (with MM/ML tags from long-read technologies like ONT and PacBio). Two of its key functions are plot and cluster. Plotting shows read alignments, methylation status, and per-read or aggregated methylation patterns. Modbamtools cluster performs clustering of reads based on methylation patterns within a region of interest. It can help reveal allele-specific methylation, cell-type–specific patterns, or heterogeneity in the data.

First, let's plot our bam file:
```bash
modbamtools plot KCNQ1OT1.bam --out . -r chr11:2696182-2703266 --prefix modbamtools.KCNQ1OT1
```

Do the reads look homogenous to you? Do you suspect that they might form multiple clusters? 

Next, let's cluster our reads. We can contrast this information with what we already know about this region from the previous exercise. Importantly, the clustering here is agnostic to the reported variants, as it focuses solely on the methylation information. 

```bash
modbamtools plot KCNQ1OT1.bam --out . -r chr11:2696182-2703266 --prefix modbamtools.KCNQ1OT1 --cluster
```

Note that from the computational perspective, deciding on the number of clusters automatically is a difficult problem, and beyond the scope of this workshop. If the number of groups is not obvious from the experimental design, we suggest playing around with the parameters. 