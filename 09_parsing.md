---
title: "Bioinformatics Workshop"
author: "Faculty of Informatics, Masaryk University"
---

<p class="workshop-date"><strong>Date:</strong> 2025-09-05</p>


<p align="center">
  <img src="assets/logo_fi_mu.png" alt="Faculty of Informatics, Masaryk University" width="180"/>
</p>

# Bioinformatics workshop

## 🧬 11:50 – 12:20 Parsing bam files from python

Pysam is a powerful python library from parsing bam files, see https://pysam.readthedocs.io/en/latest/index.html. It allows versatility in parsing bam files and extracting user-defined useful information. SAM format can be a bit difficult to parse with all the tags, and various separators. We would strongly advise against parsing SAM/BAM files without the appropriate library, like pysam. In the simplest case, one could loop through all sequencing reads one by one, and extract their MM, ML tags `read.get_tag("MM")` and `read.get_tag("MM")`. Here is an example of a small script that parses a BAM, and filters out problematic reads with no Ml tags. 

- **Parsing in pysam**:

```python
import sys
import pysam

filename = sys.argv[1]
samfile = pysam.AlignmentFile(filename, "rb")
output_filtered = pysam.AlignmentFile(filename+".onlyMlTags.bam", "wb", template=samfile)
output_missing = pysam.AlignmentFile(filename+".missingTags.bam", "wb", template=samfile)

counter=0
for read in samfile:
    #print(read.query_name)
    try:
        ml_tag = read.get_tag("Ml")
        output_filtered.write(read)
    except KeyError:
        #print("The 'Ml' tag was not found.")
        output_missing.write(read)
        counter+=1


samfile.close()
print("Done. Output file created. The number of reads with missing Ml tags: ", counter)
print("Please modify the script if you wish to filter ML and not Ml tags. ")
```

The code should be fairly self-explanatory. For the last exercise, parse your bam file in order to only print 5mC, and ignore 5hmC. There are multiple ways to do this, depending on your initial bam files; the main goal of this exercise is to learn how to access methylation tags from within python. 
