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

When you are interested in studying methylation with long reads, you first need to ensure that you're using the appropriate dataset that carries methylation information. For long reads, this will be typically stored in a bam file within so called "methylation tags", that carry both the information about the positions of the nucleotides you're interested in studying the modification of, such as methylated cytosines, as well as the probability that such modifications are real, provided that the basecalled nucleotide is correct.  

*Note:* Consider also the biological source of your data. For example, amplified DNA will have no modified nucleotides. In another example, 5hmC will be rare in certain tissues (and common in a brain tissue).

In order to map reads, we first need to use a mapper that is suitable for long reads. Two great choices are minimap2 and winnowmap (optimized for highly repetitive genomic regions). Since minimap2 is a versatile aligner, we need to specify the type of reads we will be working with, as HiFi and ONT (nanopore) will have different error profiles. Moreover, recent R10 chemistries for the Oxford Nanopore have base qualities approaching HiFi, and are thus more accurate than older R9 flowcells. 

``

Now let's map our reads:
```bash
samtools fastq -T MM,ML unmapped.bam | minimap2 -ax map-ont -y -R "@RG\tID:KCNQ1OT1\tSM:hg002\tPL:ONT" GCA_000001405.15_GRCh38_no_alt_analysis_set.fna - | samtools view -bh - | samtools sort >KCNQ1OT1.bam
samtools index KCNQ1OT1.bam
``` 

First, we carry over our methylation tags and pass them to **minimap2**. Note that this code pipes fastq reads that carry methylation tags in their header, but you could just as easily use both fastq/bam. Do not forget to sort and index the final bam file, as this will be requested by all the downstream applications. 

In real life, you might consider creating and indexed reference, so that mapping of the reads becomes significantly faster. Our bam file has now been converted from unmapped bam file to a mapped bam file (sometimes called modbam to emphasize the presence of modifications). Note that mapped bam file can be converted back to unmapped if needed, for example should the reads be re-mapped to another reference. An unmapped bam file is often called ubam.

Let's check that we have not accidentally dropped the methylation tags. Note that the typical bam file without modification won't have MM, ML tags present. If you see MM, ML tags, but they are not followed by any numbers, this means the modification have been called, but not found (and the reason for this will be typically biological, not technical). Note that MM tag defines the positions of modified nucleotides, and ML the probability of the modifications. Multiple modifications can be defined in a single file. Note that when analyzing 5mC, this does not mean that all cytosined will be enumerated. In fact, many C nucleotides will typically be skipped (check samtools specification for more details on how this is defined).  

```bash
samtools view KCNQ1OT1.bam | egrep -o 'MM:Z:[^[:space:]]+'
samtools view KCNQ1OT1.bam | egrep -o 'ML:B:[^[:space:]]+'
```

Awesome, now we have a bam file with confirmed methylation tags. In order to visualize it, we can use either IGV or UCSC Genome browser. To do this, we either need to use one of the references pre-loaded by IGV, or a custom reference. The sequence names, typically chromosome, need to match between our bam file and the reference. Note that both reference and the bam file can be either loaded remotely (for example if hosted on a website) or present locally. Let's open IGV and explore. Navigate to the location of KCNQ1OT1, by typing it into the search. Do you recognize this gene? Turn the methylation on. What do you see? Does this match your expectation? 



