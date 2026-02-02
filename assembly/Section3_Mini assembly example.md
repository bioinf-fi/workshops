# Run hifiasm and verkko

In this exercise, you will finally assemble some data, yeay! Here, we will try hifiasm (expect ~2-minute run) and verkko (expect ~5-minute run).

## hifiasm

Hifiasm is a true workhorse assembler, especially suitable for non-model organisms, or when limited data is available (for the ideal T2T recipe and diploid human genomes, verkko outperforms hifiasm at the time of the preparation of workshop materials).

```bash
# Run on test data (use -f0 for small datasets)
# only download if not in A219 (otherwise look in workshops/assembly/datasets)
wget -O ../datasets/chr11-2M.fa.gz https://github.com/chhylp123/hifiasm/releases/download/v0.7/chr11-2M.fa.gz
hifiasm -o test -t4 -f0 ../datasets/chr11-2M.fa.gz 2> test.log
awk '/^S/{print ">"$2;print $3}' test.bp.p_ctg.gfa > test.p_ctg.fa  # get primary contigs in FASTA
```

Study all possible input data combinations available at the manual page of hifiasm: <https://github.com/chhylp123/hifiasm?tab=readme-ov-file>. Note that while hifiasm was originally developed for hifi data, it works very well with hifi+ont integration, and can work with both ultra-long, as well as standard ligation protocol. Importantly, hifiasm can also handle modern ONT data that is *not* ultra-long (ONT-UL). Let's try to run it using this example data (~2 minutes). You can explore the output in bandage and/or quast, or using any of the commands we tried previously.

## verkko

```bash
# only download if not in A219 (otherwise look in workshops/assembly/datasets)
wget -O ../datasets/hifi.fastq.gz https://obj.umiacs.umd.edu/sergek/shared/ecoli_hifi_subset24x.fastq.gz
wget -O ../datasets/ont.fastq.gz https://obj.umiacs.umd.edu/sergek/shared/ecoli_ont_subset50x.fastq.gz
verkko -d asm --hifi ../datasets/hifi.fastq.gz --nano ../datasets/ont.fastq.gz
```

While verkko is more dependent on specific input data type requirements, when those are provided, it is arguably the best diploid assembler. In this exercise, we will use a toy E. coli K12 example, so this assembly should run quite fast (~5 minutes).

Note that in real world, you would most likely want to run verkko with HiC reads as well (using --hic1 or --hic2). This is because HiC data represent a convenient option for sequence scaffolding.
