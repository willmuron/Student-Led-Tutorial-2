# Student-Led-Tutorial-2
# Task: Tutorial for De Novo Assembly Using SPAdes
# Date: February 20th

## **Objective**
Prepare a tutorial for your peers on performing a **de novo genome assembly** using the SPAdes assembler. This tutorial will guide students through data preparation, running SPAdes, analyzing assembly quality, and visualizing the results.

---

## **Required Software**
1. **SPAdes**: For de novo genome assembly.
   - [SPAdes Documentation](https://cab.spbu.ru/software/spades/)
2. **QUAST**: For assembly quality assessment.
   - [QUAST Documentation](https://quast.sourceforge.net/quast)
3. **Bandage**: For assembly visualization (optional but recommended).
   - [Bandage GitHub](https://github.com/rrwick/Bandage)

---

## **Data to Use**
- **Sample Dataset**: Use a small bacterial genome dataset from [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra).
  - Example: E. coli reads, accession number **SRR12936357**.
- Download the paired-end FASTQ files:
  ```bash
  fastq-dump --split-files SRR12936357
