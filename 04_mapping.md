---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 9:35 – 10:00 Mapping & Visualization

When studying methylation with long reads, the first step is to make sure you’re working with a dataset that actually contains methylation information. For long-read sequencing, this information is usually stored in a BAM file under methylation tags. These tags record both:

- the genomic positions of nucleotides of interest (e.g., methylated cytosines)  
- the probability that the modification is real (assuming the basecalled nucleotide itself is correct)  

⚠️ Important reminder: always consider the biological source of your data. For instance, amplified DNA won’t contain any modifications at all. Similarly, 5hmC will be rare in most tissues, but quite common in brain tissue.

To map reads, we need a mapper designed for long-read data. Two excellent options are:  
minimap2 – versatile and widely used  
winnowmap – optimized for  repetitive regions  

When using minimap2, remember to specify the type of reads you’re working with, since HiFi and ONT (nanopore) have different error profiles. Also, keep in mind that recent R10 nanopore chemistries achieve base qualities close to HiFi, making them more accurate than the older R9 flowcells.

Now let's map our reads:
```bash
samtools fastq -T MM,ML unmapped.bam | minimap2 -ax map-ont -y -R "@RG\tID:KCNQ1OT1\tSM:hg002\tPL:ONT" GCA_000001405.15_GRCh38_no_alt_analysis_set.fna - | samtools view -bh - | samtools sort >KCNQ1OT1.bam
samtools index KCNQ1OT1.bam
``` 

First, we carry over our methylation tags and pass them to **minimap2**. Note that this code pipes fastq reads that carry methylation tags in their header, but you could just as well use fastq/bam. Do not forget to sort and index the final bam file, as this will be requested by all the downstream applications. 

In practice, it’s often useful to create an indexed reference, since this makes the mapping process much faster. At this point, our BAM file has been converted from an unmapped BAM into a mapped BAM. When methylation information is included, this is sometimes called a modBAM to highlight the presence of modifications. Keep in mind that a mapped BAM can also be converted back into an unmapped version if you ever need to re-map the reads to a different reference. An unmapped BAM is often referred to as a uBAM.

Let's check that we have not accidentally dropped the methylation tags. Note that the typical bam file without modification won't have MM, ML tags present. If you see MM, ML tags, but they are not followed by any numbers, this means the modification have been called, but not found (and the reason for this will be typically biological, not technical). 

The MM tags define the positions of modified nucleotides, and ML the probability of modifications. Multiple modifications can be defined in a single file. When analyzing 5mC, keep in mind that not every cytosine will be listed in the tags. In fact, many cytosines are usually skipped. The exact rules for how this is determined are described in the SAMtools and modkit documentation.

```bash
samtools view KCNQ1OT1.bam | egrep -o 'MM:Z:[^[:space:]]+'
samtools view KCNQ1OT1.bam | egrep -o 'ML:B:[^[:space:]]+'
```

Great! We now have a BAM file with confirmed methylation tags. The next step is to visualize the data using a tool like IGV or the UCSC Genome Browser.  

To do this, you’ll need a reference genome—either one of the pre-loaded references in IGV or your own custom reference. Make sure that the sequence names (such as chromosome labels) are consistent between your BAM file and the reference. Both the reference and the BAM file can be loaded either locally (from your computer) or remotely (for example, from a website).  

Let’s try this in IGV:  
- Open IGV and load the hg38 reference, in our case represented by the provided file `GCA_000001405.15_GRCh38_no_alt_analysis_set.fna`
- Load your BAM file  
- In the search bar, type KCNQ1OT1 to jump to that gene  
- Turn on the methylation track  

Do you recognize this gene? What do you observe in the methylation pattern—and does it match what you expected?



