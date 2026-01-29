NanoPlot --fastq fast.fastq -o "nanoplot.fast" --no_static
NanoPlot --fastq hac.fastq -o "nanoplot.hac" --no_static
NanoPlot --fastq sup.fastq -o "nanoplot.sup" --no_static

samtools fastq -T MM,ML unmapped.bam | minimap2 -ax map-ont -y -R "@RG\tID:KCNQ1OT1\tSM:hg002\tPL:ONT" GCA_000001405.15_GRCh38_no_alt_analysis_set.fna - | samtools view -bh - | samtools sort >KCNQ1OT1.bam
samtools index KCNQ1OT1.bam
# first quickly index the .fna:
samtools faidx GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
# then proceed with modkit:
modkit pileup \
    KCNQ1OT1.bam KCNQ1OT1.modkit.bedgraph \
    --filter-threshold C:0.8 \
    --ignore h \
    --force-allow-implicit \
    --cpg \
    --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
    --combine-strands \
    --bedgraph

bcftools mpileup KCNQ1OT1.bam --fasta-ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna | bcftools call -mv -Oz -o KCNQ1OT1.vcf.gz
tabix -p vcf KCNQ1OT1.vcf.gz

# zcat KCNQ1OT1.vcf.gz | egrep --color 2696063
# zcat KCNQ1OT1.vcf.gz | egrep --color 2696082

whatshap phase --reference GCA_000001405.15_GRCh38_no_alt_analysis_set.fna KCNQ1OT1.vcf.gz KCNQ1OT1.bam -o KCNQ1OT1.phased.vcf.gz
tabix -p vcf KCNQ1OT1.phased.vcf.gz

# zcat KCNQ1OT1.phased.vcf.gz | egrep --color 2696063
# zcat KCNQ1OT1.phased.vcf.gz | egrep --color 2696082

whatshap haplotag -o KCNQ1OT1.haplotagged.bam --reference GCA_000001405.15_GRCh38_no_alt_analysis_set.fna KCNQ1OT1.phased.vcf.gz KCNQ1OT1.bam --output-haplotag-list haplotypes.tsv
samtools index KCNQ1OT1.haplotagged.bam

whatshap split --output-h1 KCNQ1OT1.h1.bam --output-h2 KCNQ1OT1.h2.bam KCNQ1OT1.haplotagged.bam haplotypes.tsv
samtools index KCNQ1OT1.h1.bam
samtools index KCNQ1OT1.h2.bam

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

modkit dmr pair \
  -a KCNQ1OT1.h1.bedMethyl.gz \
  -b KCNQ1OT1.h2.bedMethyl.gz \
  -o KCNQ1OT1.dmr \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --base C \
  --log-filepath dmr.log

modkit dmr pair \
  -a KCNQ1OT1.h1.bedMethyl.gz \
  -b KCNQ1OT1.h2.bedMethyl.gz \
  --segment dmr.segments.bed \
  --ref GCA_000001405.15_GRCh38_no_alt_analysis_set.fna \
  --base C \
  --log-filepath dmr.segments.log

modbamtools plot KCNQ1OT1.bam --out . -r chr11:2696182-2703266 --prefix modbamtools.KCNQ1OT1
modbamtools plot KCNQ1OT1.bam --out . -r chr11:2696182-2703266 --prefix modbamtools.KCNQ1OT1 --cluster
