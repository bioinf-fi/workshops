# Analyze a single chromosome

In this section, you will learn how to perform basic checks for an assembly. To simplify this process, we will first analyze a single chromosome. Please download this mystery chromosome from [here.](https://is.muni.cz/el/fi/podzim2025/PV269/um/mystery/mystery.fasta)

## Chromosome name

Let's check the header of the available fasta file.

`grep "^>" ../datasets/mystery.fasta`

Here, we used '^' symbol to specify that we expect this symbol to be present at the very beginning of a row, and not in other places. This is a good practice since in other situations, significant characters can be present in other places, too (think sequence quality symbols in the FASTQ format). We also use quotes, since redirect character '>' can be used to overwrite files in certain situations (not here, but as a precaution). Did we learn anything interesting from the header or is this sequence still a mystery?

## Chromosome length

Maybe the length of the sequence can give us a clue about which chromosome this is. While there are many ways to count the sequence length, one of the most convenient is running [bioawk](https://github.com/lh3/bioawk).

`bioawk -c fastx '{ print $name, length($seq) }' < ../datasets/mystery.fasta`

What is the length of this chromosome? If you knew that this sequence comes from human, what chromosomes would be most likely hits? If you are unsure about the lengths of chromosomes in human, now would be a good time to look them up. Note your guess for later :-)

Note: If you are curious about bioawk, <https://pmitev.github.io/to-awk-or-not/Bio/bioawk/> shows a useful table of names for columns with different bio formats invoked by the -c argument.

## Telomeres

A good indication that a chromosome is assembled completely, that is T2T (Telomere-To-Telomere) is that the telomeres are present on both ends. A convenient (or quick and dirty) way to identify telomeres is again using seqtk (for precise boundaries you might want to consider TeloBP <https://github.com/GreiderLab/TeloBP>). We will increase the sensitivity of the command by using -s parameter. Note that seqtk telo is only available in newer versions of the software, since it was added to the package later.

`seqtk telo -s 10 ../datasets/mystery.fasta`

Now that you found telomeres computationally, let's also visualize them directly in the sequence.

`egrep --color "TTAGGG" ../datasets/mystery.fasta`

Where is the sequence located? What happens if you search for the reverse complement of this sequence?

## Gaps

When assembling sequences, one of the quality metrics is the number and lengths of the gaps (unknown sequences or Ns). Recall that if no gaps are present, assembled sequence is called a contig, versus sequence with Ns would be called a scaffold. Historically, contigs were scaffolded using many different techniques, including HiC, RNASeq data, or using (known) reference genomes.

`seqtk gap -l 0 ../datasets/mystery.fasta`

Note that the -l parameter refers to the minimum length of gaps that should be reported.

## Mapping to the reference

We already know a lot about this mystery sequence but we still don't know for sure which chromosome it is. It's time to change this! To derive the correct chromosome, we will have to compare our sequence to the human reference genome. Which one? That doesn't matter, because we only want to know the chromosome name, but we will proceed with the T2T CHM13, because it's a complete genome assembly, with one sequence per chromosome (side note: do you remember the difference between CHM13 and hg38, or HG002?). When aligning sequences, there are generally two options: slow and precise, or fast and approximate. Which one do you this is more preferrable in this case? Yes, we will go with fast and approximate! An ideal tool for this purpose is called mashmap, but even mashmap could be slow for local alignments. Instead, we will use a global alignment and go with the --no-split option, suggesting that we're only interested in the best hit for our whole mystery sequence all at once. When aligning sequences, one can only align sequences that are not too divergent -- afterwards, the alignment becomes too ambigous. As a rule of thumb, this number is typically 85% (and it usually does not make sense to go below 70%). However, we expect our mystery sequence to be from human, so we will set the minimum percent identity high to speed things up. Thefore, modify the command below to only look for hits with at least 95% identity.

```bash
mkdir mashmap
mashmap --noSplit -t 6 --pi 99 -r ../datasets/chm13.fa.gz -q ../datasets/mystery.fasta -o mashmap/mashmap.out
```

You can download CHM13 reference genome from [its github repository.](https://github.com/marbl/CHM13/tree/master?tab=readme-ov-file#downloads).

Yeay! We now know what the mystery chromosome is.
(If you still have additional time, study the manual for mashmap, wfmash, and various possibilities with bioawk.)
