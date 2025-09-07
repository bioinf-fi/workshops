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

Pysam is a comprehensive Python library designed for working with BAM files (documentation available at pysam.readthedocs.io
). It provides robust functionality for parsing BAM files and extracting user-defined information in a flexible and efficient manner.  

Given the complexity of the SAM/BAM format—with its numerous tags and delimiters—it is strongly recommended to use a specialized library such as pysam, rather than attempting to parse these files manually.  

In the simplest case, one could loop through all sequencing reads one by one, and extract their MM, ML tags `read.get_tag("MM")` and `read.get_tag("MM")`. The following script separates reads based on the presence of the Ml tag in a BAM file, writing reads with the tag to one output and reads without the tag to another. It also reports the number of reads lacking the Ml tag. (Note that SAM/BAM tag names are case-sensitive; this example targets Ml. Adjust as needed if your data use ML.)  

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

The code should be largely self-explanatory. As a final exercise, parse your BAM file so that you print only 5mC calls while excluding 5hmC. There are multiple valid approaches depending on how your BAM encodes modifications; the primary objective is to practice accessing and interpreting methylation tags in Python.
