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
3. **Bandage**: For assembly visualization.
   - [Bandage GitHub](https://github.com/rrwick/Bandage)

---

## **Data to Use**
- **Sample Dataset**: Use a small bacterial genome dataset from [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra).
  - Example: E. coli reads. Or Covid19: https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR11177792&display=download
- Download the paired-end FASTQ files:
  ```bash
  fastq-dump --split-files SRR11177792

- Output files:
   - SRR11177792_1.fastq (forward reads).
   - SRR11177792_2.fastq (reverse reads).
 
## **Tasks and Deliverables**
### **Part 1: Data Preparation**
1. Download the raw sequencing data in FASTQ format (using the command above).
2. Perform a quality check on the reads using FastQC (optional but recommended):
   - FastQC Documentation.
   - Run FastQC;

   ```bash
   fastqc SRR11177792_1.fastq SRR11177792_2.fastq

3. Optionally trim low-quality bases and adapters using Trimmomatic:
   ```bash
   trimmomatic PE -phred33 SRR11177792_1.fastq SRR11177792_2.fastq \
   trimmed_1.fastq unpaired_1.fastq trimmed_2.fastq unpaired_2.fastq \
   ILLUMINACLIP:adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:36

### **Part 2: Running SPAdes**
1. Perform de novo assembly using SPAdes:
   ```bash
   spades.py -1 SRR11177792_1.fastq -2 SRR11177792_2.fastq -o spades_output
- -1 and -2: Paired-end reads.
- -o: Specify the output directory (e.g., spades_output).
2. Explore the SPAdes output files:
   - *contigs.fasta*: Assembled contigs.
   - *scaffolds.fasta*: Assembled scaffolds (contigs linked by paired-end reads).
   - *assembly_graph.gfa*: Graph representation of the assembly.

### **Part 3: Assessing Assembly Quality**

1. Use QUAST to evaluate assembly quality:
   ```bash
   quast.py -o quast_output spades_output/contigs.fasta

2. Review key metrics:
   - N50: Length of the shortest contig in the smallest set covering 50% of the genome.
   - Total number of contigs.
   - Total assembly length.
   - GC content.

### **Part 4: Visualizing the Assembly**
1. Use Bandage to visualize the assembly graph:
- Load the SPAdes assembly graph (spades_output/assembly_graph.gfa) into Bandage.
- Identify contigs and potential misassemblies.
- Save a screenshot of the graph.
