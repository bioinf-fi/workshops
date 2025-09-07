---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 8:45 – 9:15 The theoretical Background

### Presentations from today ###
Slides, theory: [link](https://docs.google.com/presentation/d/1-ekXEGOxl5r3urT2RA2TePoSYZ_5Q0hyZjvXNBWIOZA/edit?usp=sharing)  

Slides, basecalling: [link](https://docs.google.com/presentation/d/1mcIcODsIgeSKjFlYZFalc06g7sxTqXuN5KdFk4JsVWs/edit?usp=sharing)  

### Preparation ###

Download and open Integrative Genomics Viewer
1) [Go to igv.org](https://igv.org)
2) Select IGV Desktop application
3) Select Download IGV (left menu)
4) Select the top option -- IGV for Linux, Java included
5) Wait for the download to finish
6) Click to extract the downloaded folder
7) Open terminal (left panel), and navigate to the downloaded folder, such as "Stazene", then follow the nested structure until you see `igv.sh`
8) Type `./igv.sh` to open and use IGV

### Visualizing the methylation in long reads ###

For our first exercise, we will visualize the methylation in pre-generated files with long reads. We will display them in IGV, a popular viewer for genomic data. Our files will be remotely hosted, so that we do not need to download them due to their large size. 

To get started, we will use a remotely located genome (in Fasta format), mapped reads (in BAM format, loaded as a File), and annotations (in BED format, also loaded as a File). The location of these files is the following:

Genome:
`https://public.gi.ucsc.edu/~mcechova/pedigree/PAN027/assembly.v1.0.PAN027.diploid.fa`
ONT reads:
`https://public.gi.ucsc.edu/~mcechova/pedigree/alignment/PAN027.filtered.ONT.bam`
Centromeric and satellite annotations (centromere is in red):
`https://public.gi.ucsc.edu/~mcechova/pedigree/annotations/PAN027/assembly.v1.0.PAN027.diploid.cenSat.bed`

Let's start exploring methylation in IGV!  

Use "Genome -> Load Genome from URL" for the genome, and File -> "Load from URL" for the reads and annotations. Since we’re focusing on centromeres, the usual human reference genome (hg38) won’t help us here—because hg38 doesn’t actually contain centromeres. To explore DNA methylation in these regions, we need to use a custom genome assembly instead.  

In this exercise, we’ll work with data from an individual named PAN027. Specifically, we’ll map reads from PAN027’s centromeric regions onto a high-quality, custom-built reference:  
`assembly_diploid_PAN027.fa`

Let's zoom in to see the alignments. Do you see any methylation? Probably not. We need to turn on the coloring by methylation first. Let's try:  
*Right click -> Color alignments by -> base modification (5mC)*  

We should see two colors, red (hypermethylation) and blue (hypomethylation). We know that centromeres are highly methylated, with a single exception -- the location where the CENP-A protein binds, the site of the kinetochore assembly. 

Let's explore this region:  
Type the following coordinates into IGV search window:  
`PAN027.chr12.maternal:38,414,737-38,550,948`  

Do you notice the red and blue regions in the reads? Try right-clicking and switching the view between expanded, collapsed, and squished. Which view do you find most useful?  

Next, take a look at the methylation signal—does it appear more or less noisy than you expected? Keep in mind, these are older R9 reads from several years ago. Current sequencing technologies are much more accurate.  

If you find yourself distracted by indels, you can right-click and adjust the indel threshold. This way, the visualization will focus on the consensus signal, while ignoring small errors from individual reads—whether those come from assembly or variant calling.  

What happens if you try other options for coloring?  
*Right click -> Color alignments by -> base modification*  

How would you visualize the 5hmC modification? Try to explore other options in the "Color alignments by" section. Can you figure out how to observe 5hmC, alongside 5mC? 

Congratulations, you just finished this section. If you still have time, feel free to explore additional genomic regions and their methylation. 
