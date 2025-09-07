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
Slides, theory: [link](https://docs.google.com/presentation/d/1-ekXEGOxl5r3urT2RA2TePoSYZ_5Q0hyZjvXNBWIOZA/edit?usp=sharing)  

Slides, basecalling: [link](https://docs.google.com/presentation/d/1mcIcODsIgeSKjFlYZFalc06g7sxTqXuN5KdFk4JsVWs/edit?usp=sharing)  

Let's start exploring methylation in IGV! To get started, we will use remotely located genome, mapped reads (loaded as File), and annotations (again loaded as File). The location of these files is the following:

Genome:
`https://public.gi.ucsc.edu/~mcechova/pedigree/PAN027/assembly.v1.0.PAN027.diploid.fa`
ONT reads:
`https://public.gi.ucsc.edu/~mcechova/pedigree/alignment/PAN027.filtered.ONT.bam`
Centromeric and satellite annotations (centromere is in red):
`https://public.gi.ucsc.edu/~mcechova/pedigree/annotations/PAN027/assembly.v1.0.PAN027.diploid.cenSat.bed`

Use "Genome -> Load Genome from URL" for the genome, and File -> "Load from URL" for the reads and annotations. You will be using a custom reference here, so traditional hg38 is not going to be helpful here. This is because we want to explore the methylation of human centromeres, and there are none in hg38, so we need a custom assembly. In our example, we will map the reads from the centromeric region of the individual called PAN027. Therefore, we will map to the custom, high-quality PAN027 assembly named `assembly_diploid_PAN027.fa`. 

Let's zoom in to see the alignments. Do you see any methylation? Probably not. We need to run on the coloring by methylation. Let's try:
*Right click -> Color alignments by -> base modification (5mC)*

We should see two color, red (hypermethylation) and blue (hypomethylation). We know that centromeres are highly methylated, with a single exception -- location where the CENP-A protein binds, critical for the kinetochore assembly. Let's explore this region:

Type the following coordinates into IGV input window:
`PAN027.chr12.maternal:38,414,737-38,550,948`

Do you see red and blue regions? Try right clicking on the reads and changing them from expanded to collapsed to squished. Which representation do you like the best? Is the methylation more or less noisy than you would had expected? Note that these are R9 reads that are several years old, and that the accuracy nowdays surpases these. Are you getting distracted by indels? Right click and adjust the indel threshold, to focus on consensus only (the tools will ignore the errors present in a single year, whether that's assembly or variant calling).

What happens if you try other options for coloring?
*Right click -> Color alignments by -> base modification*
How would you visualize the 5hmC modification? Try to explore other options in the "Color alignments by" section. 
