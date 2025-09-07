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

As before, we will be exploring the gene `KCNQ1OT1`, by typing its name in the IGV search. What do you know about this genomic region? Turn off the methylation, and color your alignments by "none" or "read strand". Having the methylation on would prevent you from exploring the sample variants. We are looking at HG002 individual from the GENOME IN A BOTTLE DATASET (GIAB), so of course this individual will have variation compared to hg38. 

Now, let’s dig deeper into the variants in our mapped file. Zoom in to this coordinate range:
`chr11:2,696,051-2,696,106`

Take a close look at the reads.  
What do you notice about the variants at positions at positions 2696063 and 2696082?  

Finally, let’s try exporting all variants into a VCF file. To do this, we’ll call variants directly from the mapped reads. For the sake of this workshop, we’ll use the naive variant caller included with bcftools:

⚠️ Important: This is just a demo. For real projects, always use a specialized variant caller—they’re far more accurate and reliable.

```bash
bcftools mpileup KCNQ1OT1.bam --fasta-ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna | bcftools call -mv -Oz -o KCNQ1OT1.vcf.gz
tabix -p vcf KCNQ1OT1.vcf.gz
```
Now, load the `KCNQ1OT1.vcf.gz` file with the variant calls into IGV.
As you inspect the reads, ask yourself: Do the variants you see match what you would expect from the data? Let's check how are these variants represented in the VCF file:  

```bash
zcat KCNQ1OT1.vcf.gz | egrep --color 2696063
zcat KCNQ1OT1.vcf.gz | egrep --color 2696082
```

Take a look at the 0/1 notation in the VCF. This tells us that one allele matches the reference (0) and the other is the alternative allele (1). But notice the 0/1 is written with a slash (/)—not a pipe (|). That means the variants are unphased.

Why does this matter? Because each variant is being reported on its own. From this output alone, we can’t tell whether the reads carrying a C at position 2,696,063 are the same reads that also carry a G at position 2,696,082.

So—let’s solve this problem by phasing the variants!

- Phase variants with **WhatsHap**:

```bash
whatshap phase --reference GCA_000001405.15_GRCh38_no_alt_analysis_set.fna KCNQ1OT1.vcf.gz KCNQ1OT1.bam -o KCNQ1OT1.phased.vcf.gz
tabix -p vcf KCNQ1OT1.phased.vcf.gz
```

(As a side note: haplotype blocks can also be extended using methylation information with a newer tool called Pomfret—but that’s a topic for another time.)

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

1. Open the haplotagged BAM (`KCNQ1OT1.haplotagged.bam`) file in **IGV**.  
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

Check out the coordinates `chr11  2696182 2703266`. Now turn the methylation back on. What do you think? This is the region that definitely seems differentially methylated between the two haplotypes, would you agree? Let's explore it further. 


