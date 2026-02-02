# Initial QC metrics

Note that after opening the terminal, you can locate `workshops` folder. Inside the workshops folder, you can locate our `assembly` folder. All the input files will be available to you in the `datasets` folder, and you will run your commands in the `workspace` folder. 

Prerequisite is to have an active bash session in the `genome-assembly` docker container:

```bash
# on the host machine in the `workshops` repository clone directory run:
cd workshops/assembly
workspace/run.sh start
```

## Input data

When you're assembling a genome, your first question will be: do I have data of sufficient quality to generate a high quality genome assembly? To answer this, you will need to first QC your input data.

```bash
# inside the container

cd /data/workspace
NanoPlot --fastq ../datasets/hifi.toy.fastq -o "nanoplot.hifi.toy" --no_static
NanoPlot --fastq ../datasets/ONT.toy.fastq -o "nanoplot.ONT.toy" --no_static
```

What's the quality of your input reads? What is their length distribution? Do you have both high-accuracy reads, as well as ultra-long reads. For a human genome, what is the coverage of the sample you just analyzed? Coverage is probably the most important factor when assembling a genome, provided that reads have sufficient length. In order to attempt a diploid assembly, you will need the coverage of at least 40x. In human, it is customary to use a genome size value around ~3.1 * 10-9.

## Basic assembly metrics

After obtaining an assembly, the first question is how many sequences were assembled. In an ideal case, each chromosome would be represented by exactly one sequences. However, occassionally chromosomes can be broken into two or three pieces, especially in the most repetitive parts of the genome, such as centromeres. To get a quick feel for how many sequences were assembled, and especially when comparing multiple assemblies, we recommend running the tool called quast. To do this, first download a [diploid human assembly](https://public.gi.ucsc.edu/~mcechova/teaching/assembly.Exercise8.fa) to work with

```bash
wget -O ../datasets/assembly.Exercise8.fa https://public.gi.ucsc.edu/~mcechova/teaching/assembly.Exercise8.fa
```

then run quast on the downloaded file from the workspace subdirectory (quast saves its output into a new folder quast_results, so we do not need to create it in advance)

```bash
quast.py ../datasets/assembly.Exercise8.fa
```

Explore files in quast_results/latest either through the command line (head, more, grep), or via your web browser. Quast provides several useful metrics, including N50, that was historically used to understand the assembly contiguity. N50 is defined as the shortest sequence length such that 50% of the total assembly length is contained in contigs or scaffolds of size greater than this length. A higher N50 indicates better, more contiguous assembly. However, in the world of complete chromosomes, this metric becomes much less useful.

## The visualization of assembly contiguity

To better understand the number of assembled sequences and their lengths, we can visualize them in a graph structure, using the .gfa format. While .gfa format can carry nucleotide sequences, in this case we will choose the version without it, for a faster visualization. The file we will be using is called *assembly.homopolymer-compressed.noseq.gfa* and should be located within the provided datasets for the workshop.

Let's open bandage, a java based application that can visualize this type of files. To upload the file, click File -> Load graph. Subsequently, click on "Draw graph" on the left panel of bandage. What do you see? What happens if you click on one of the sequences? In an ideal case, how many sequences would you expect to see for a complete assembled diploid human genome? Please, compare your graph with your neighbors in the classroom, have you noticed anything interesting?

Note: Please, note that both verkko and hifiasm will output .gfa as one of the outputs of the assembly.

## The visualization of a phased diploid human genome

Now that you understand how the genomes can be visualized using bandage, you might be interested in knowing which chromosomes originate from mother, and which chromosomes originate from father. This process is called haplotyping or phasing (the two are used interchangeably but have slightly different meanings originally), and the theory behind it will be covered in one of the next sections. Here, we will just load the annotations of maternal and paternal chromosomes, stored in a .csv file. In our case, this file is called *assembly.colors.csv*, and is located within the provided datasets for the workshop.

Load annotation.csv file. The individual sequences are now colored. The parent of origin is not the only information that can be used for coloring -- you can use any annotation, including chromosome number or gene names.

If you finished this section and still have time, you can play with additional parameters for nanoplot and explore additional plots.
