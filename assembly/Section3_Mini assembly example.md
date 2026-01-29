# Run verkko and hifiasm

## verkko

`verkko -d <work-directory> --hifi hifi_reads.fastq --nano ont_reads.fastq`

This is a toy example, so this assembly should run quite fast. You can again explore the output in bandage and/or quast, or using any of the commands we tried previously. 

Note that in real world, you would most likely want to run verkko with HiC reads as well (using --hic1 or --hic2). This is because HiC data represent a convenient option for sequence scaffolding. 

## hifiasm

Hifiasm is a true workhorse assembler, especially suitable for non-model organisms, or when limited data is available (for the ideal T2T recipe and diploid human genomes, verkko outperforms hifiasm at the time of the preparation of workshop materials). 

`hifiasm -o ONT_assembly --ont ont_reads.fastq`

Study all possible input data combinations available at the manual page of hifiasm: https://github.com/chhylp123/hifiasm?tab=readme-ov-file. Note that while hifiasm was originally developed for hifi data, it works very well with hifi+ont integration, and can work with both ultra-long, as well as standard ligation protocol. Importantly, hifiasm can also handle modern ONT data that is *not* ultra-long (ONT-UL).

