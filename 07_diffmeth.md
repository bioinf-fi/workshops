---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 11:00 – 11:30 Differential Methylation

We noticed that maternal and paternal haplotype differ for this region. To formalize this observation, let's compare maternal versus paternal haplotype using **modkit**:

Let's start by generating two sets of methylation calls, one for each haplotype.
```bash
modkit pileup KCNQ1OT1.h1.bam - \
  --cpg \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --log-filepath log.h1.txt | bgzip -c > KCNQ1OT1.h1.bedMethyl.gz
tabix -p bed KCNQ1OT1.h1.bedMethyl.gz

modkit pileup KCNQ1OT1.h2.bam - \
  --cpg \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --log-filepath log.h2.txt | bgzip -c > KCNQ1OT1.h2.bedMethyl.gz
tabix -p bed KCNQ1OT1.h2.bedMethyl.gz
```

Now that we have independent methylation calls for each haplotype, let's perform differential methylation analysis. 

```bash
modkit dmr pair \
  -a KCNQ1OT1.h1.bedMethyl.gz \
  -b KCNQ1OT1.h2.bedMethyl.gz \
  -o KCNQ1OT1.dmr \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --base C \
  --log-filepath dmr.log
```

The output of this comparison is the file `KCNQ1OT1.dmr`. Let's open it and explore. It might also be useful to sort the output by the 5th column and compare the largest and the smallest differences in methylation between haplotypes at given position. Let's open those in IGV and take a look.

```bash
cat KCNQ1OT1.dmr | sort -rgk5 | head
cat KCNQ1OT1.dmr | sort -rgk5 | tail
```

Using the output from this file, copy and paste few of the regions and validate them in IGV. Do you agree with the final report? 

Now let's run segmentation analysis, which will report broader regions that are differentially methylated, and which uses a different algorithm to compute the differences.

```bash
modkit dmr pair \
  -a KCNQ1OT1.h1.bedMethyl.gz \
  -b KCNQ1OT1.h2.bedMethyl.gz \
  --segment dmr.segments.bed \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --base C \
  --log-filepath dmr.segments.log
```

Now, let's explore the regions reported in dmr.segments.bed in IGV. Which of the two modes for the differential methylation analysis do you prefer? 

## What to look at in the outputs
- **Effect direction**:
  - Positive Δ (and positive effect size) versus negative Δ (depending on the order of the samples/haplotypes)
  - **Coverage** (min reads per site/region).
- **Context**: use `--base C` for 5mC; for other mods (e.g., 6mA), change `--base` accordingly.


## Visualizing Beta Distributions in Modkit

Modkit models methylation signals using beta distributions, which capture both the mean methylation and uncertainty. The following plot shows typical beta distribution shapes across different methylated and unmethylated signal states:

<img src="https://nanoporetech.github.io/modkit/images/beta_distributions.png"
     alt="Beta distributions for methylation modeling"
     width="70%">
