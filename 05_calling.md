---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 10:00 – 10:15 Call Methylation
Call methylation with **modkit**:

This section will cover how to call variants from a pileup of reads with methylation tags. Essentially, this time we will be considering the support for a methylation at a given position, using all the reads spanning such position. Let's use modkit to do this.

```bash
modkit pileup \
    KCNQ1OT1.bam KCNQ1OT1.modkit.bedgraph \
    --filter-threshold C:0.8 \
    --ignore h \
    --force-allow-implicit \
    --cpg \
    --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
    --combine-strands \
    --bedgraph
```
There is a simpler way to run modkit, but mentioning these options explicitly might help you to be forced to consider what settings are the most appropriate for your project specifically.

Let's break this command down using modkit's advanced documentation from https://github.com/nanoporetech/modkit/blob/master/book/src/advanced_usage.md.

 *--filter-threshold*

Higher number means stricter filtering. Always note your sequencing coverage, as low coverage samples might accidentally pass thresholds (3 reads out of 4 supporting methylation are statistically very different from 30/40).

*--ignore h*
This time, we're only interested in 5mC, not 5hmC. This might or might not be a good idea depending on your biological sample. 

          Ignore a modified base class in situ by redistributing base
          modification probability equally across other options. For example, if
          collapsing 'h', with 'm' and canonical options, half of the
          probability of 'h' will be added to both 'm' and 'C'. A full
          description of the methods can be found in collapse.md

 *--combine-strands*
          When performing motif analysis (such as CpG), sum the counts from the
          positive and negative strands into the counts for the positive strand
          position

 *--cpg*
          Only output counts at CpG motifs. Requires a reference sequence to be
          provided as well as FAI index
          
 *--bedgraph*

 Convenient output file format that includes not only the probability of each modification, but also sequencing coverage. Always check sequencing coverage before trusting any modifications. 

Note that modkit's update-tags command renames Mm/Ml to tags to MM/ML.

Now that you understand what modkit did, please load your **bedGraph** into IGV. By default, modkit will produce a folder with modifications. Locate the file `m_CG0_combined.bedgraph` and load it.
 Does the result match your expectation? What happens if you lower the filter-threshold, or do not ignore 5hmC? How does the output look like if you do not use --bedgraph option? 

Congratulations, you just finished this section! If you still have time, please continue reading modkit's documentation, as there are many options that will influence on your output. Ultimately, the chosen settings will be guided by your biological question. 



