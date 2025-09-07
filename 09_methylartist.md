---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 11:50 – 12:20 Exploring DNA Methylation with Methylartist   

First, let's plot our bam files:
```bash
methylartist locus -b KCNQ1OT1.h1.bam -i chr11:2606328-2701998 -o kcnq1ot1_hap1 -n KCNQ1OT1_hap1 --genes KCNQ1OT1 --motif CG --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
methylartist locus -b KCNQ1OT1.h2.bam -i chr11:2606328-2701998 -o kcnq1ot1_hap2 -n KCNQ1OT1_hap2 --genes KCNQ1OT1 --motif CG --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna

```

Methylartist will now plot all methylated Cs, separately for each haplotype. Compare the two generated plots visually. Do the results match your expectations? 

Congratulations! You have now completed all the workshop materials! 🎉

