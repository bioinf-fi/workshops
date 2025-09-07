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

In this section, we’ll learn how to call methylation from a pileup of reads that include methylation tags. The idea is simple: for each genomic position, we’ll use all the reads that cover that site to evaluate whether there’s evidence of methylation.  

We’ll use modkit for this task. Here’s an example command:  

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
While there’s a simpler way to run modkit, listing out these options is useful—it encourages you to think carefully about which parameters make the most sense for your specific project.  

Let's break this command down using modkit's advanced documentation from https://github.com/nanoporetech/modkit/blob/master/book/src/advanced_usage.md.

 *--filter-threshold*

A higher number corresponds to stricter filtering. Always keep your sequencing coverage in mind—because thresholds can behave very differently depending on how much data you have. For example, 3 out of 4 reads supporting methylation is not nearly as reliable as 30 out of 40 reads, even though both technically meet the same ratio.

*--ignore h*
          
This time, we're only interested in 5mC, not 5hmC. This might or might not be a good idea depending on your biological sample. Ignore a modified base class in situ by redistributing base modification probability equally across other options. For example, if collapsing 'h', with 'm' and canonical options, half of the probability of 'h' will be added to both 'm' and 'C'. A full description of the methods can be found in collapse.md

 *--combine-strands*

When performing motif analysis (such as CpG), sum the counts from the positive and negative strands into the counts for the positive strand position

 *--cpg*
 
 Only output counts at CpG motifs. Requires a reference sequence to be provided as well as FAI index
          
 *--bedgraph*
          
Convenient output file format that includes not only the probability of each modification, but also sequencing coverage. Always check sequencing coverage before trusting any modifications. 

👉 Side note: the update-tags command in modkit renames the Mm/Ml tags to MM/ML.

Now that we’ve seen what modkit does, let’s try visualizing the results. Load your bedGraph file into IGV. By default, modkit creates a folder with modification files—look for m_CG0_combined.bedgraph and open it.

Once it’s loaded, ask yourself:  
  -Does the result look like what you expected?  
  -What changes when you lower the filter-threshold?  
  -What do you see if you include 5hmC instead of ignoring it?  
  -And finally, how does the output differ if you don’t use the --bedgraph option at all?  

Congratulations—you’ve completed this section! If you have some extra time, we encourage you to explore the modkit documentation. There are many additional options available, and each can shape your results in different ways. Ultimately, the best settings will depend on the biological question you’re trying to answer.



