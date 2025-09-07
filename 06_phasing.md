---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 10:30 – 11:00 Phasing & Methylation

We typed `KCNQ1OT1` in the IGV search window. What do you know about this genomic region? Do we expect it to be methylated or unmethylated?


Let's explore the variants in our mapped file. Let us now zoom in to this region:
`chr11:2,696,051-2,696,106`

What do you notice about the reads carrying the variants at positions 2696063 and 2696082?

Let's output all variants into a VCF file. How do we do this? We use mapped reads to call variants.
This time, we will use a naive variant caller from bcftools. 
*Note:* do not do this at home! Use a more sophisticated variant caller for your research projects instead. 

```bash
bcftools mpileup KCNQ1OT1.bam --fasta-ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna | bcftools call -mv -Oz -o KCNQ1OT1.vcf.gz
tabix -p vcf KCNQ1OT1.vcf.gz
```
Load the `KCNQ1OT1.vcf.gz` file with variants into IGV and take a look. Are the variants you're observing in the reads called as you would expect? 

```bash
zcat KCNQ1OT1.vcf.gz | egrep --color 2696063
zcat KCNQ1OT1.vcf.gz | egrep --color 2696082
```

Notice the 0/1 notation. This means that we observe one reference allele (0) and one alternative allele (1). However, these are not phased, hence */*.

This is because both of these variants are reported independently. From this output, it is not clear whether the reads carrying C at the position 2696063 also carry G at the position 2696082, or not. Let's phase them!

- Phase variants with **WhatsHap**:

```bash
whatshap phase --reference GCA_000001405.15_GRCh38_no_alt_analysis_set.fna KCNQ1OT1.vcf.gz KCNQ1OT1.bam -o KCNQ1OT1.phased.vcf.gz
tabix -p vcf KCNQ1OT1.phased.vcf.gz
```

(Note that you could extend the haplotype blocks using the methylation information and the new tool called **Pomfret**. But that is a story for another time.)

```bash
zcat KCNQ1OT1.phased.vcf.gz | egrep --color 2696063
zcat KCNQ1OT1.phased.vcf.gz | egrep --color 2696082
```

Note that all the variants with 1|0 will originate from one parent, and all variants with 0|1 from the second parent -- at least in each of the phased blocks. 

Now that we have phased our variants, let's tag our reads by haplotype.

```bash
whatshap haplotag -o KCNQ1OT1.haplotagged.bam --reference GCA_000001405.15_GRCh38_no_alt_analysis_set.fna KCNQ1OT1.phased.vcf.gz KCNQ1OT1.bam --output-haplotag-list haplotypes.tsv
samtools index KCNQ1OT1.haplotagged.bam
```
Notice and explore one of the output files, `haplotypes.tsv`.

1. Open the BAM file in **IGV**.  
2. Right-click on the BAM track and select **Color alignments by → tag**.  
3. Enter **HP** as the tag and click **OK**. 

To reorder by haplotype, right-click and select Sort Alignments by → HP tag. Now that the alignments are sorted, we can turn on the methylation on again. Voilà!

Oh no! This is a bit hard to interpret. Let's split our reads into two bam files, based on the HP tag.

```bash
whatshap split --output-h1 KCNQ1OT1.h1.bam --output-h2 KCNQ1OT1.h2.bam KCNQ1OT1.haplotagged.bam haplotypes.tsv
samtools index KCNQ1OT1.h1.bam
samtools index KCNQ1OT1.h2.bam
```

Clear your IGV session with File -> New session. Then load both bam files, representing the two haplotypes. You can just drag and drop them to your IGV screen. If your alignments are taking too much space, right click and use "Collapsed" option. 

Check out the coordinates `chr11  2696182 2703266`. What do you think? This is the region that definitely seems differentially methylated between the two haplotypes. Let's explore it further. 


