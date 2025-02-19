#!/bin/bash
#SBATCH --job-name=install_dependencies       # Name of the job
#SBATCH --output=install_dependencies.log     # Output log file
#SBATCH --time=04:00:00               # Time limit (3 hours to be safe and if files larger that 10 Gb)
#SBATCH --ntasks=1                    # Use 1 task
#SBATCH --mem=1G                      # Request 2 GB of memory
#SBATCH --partition=RM-shared          # Use the standard partition (ensure it has internet access)
#SBATCH --mail-user=your.email@svsu.edu  # Add your email address here
#SBATCH --mail-type=ALL               # Send email notifications for all job states (BEGIN, END, FAIL)

# Load the SRA Toolkit module. This is the software we will use for this job. Already available in the HPC, but must be loaded.
module load sra-toolkit


# Download SPAdes.
wget https://github.com/ablab/spades/releases/download/v3.15.0/SPAdes-3.15.0-Linux.tar.gz

# Unpack and extract the tar file SPAdes.
 tar -xvzf SPAdes-3.15.0-Linux.tar.gz


# Download quast.
 wget https://github.com/ablab/quast/releases/download/quast_5.3.0/quast-5.3.0.tar.gz

# Unpack and extract the tar file for quast.
 tar -xvzf quast-5.3.0.tar.gz


# Download fastqc.
 wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip

# Unpack and extract the zip file for fastqc.
 unzip fastqc_v0.12.1.zip


#Download Trimmomatic.
 wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip

# Unpack and extract the zip file for Trimmomatic.
 unzip Trimmomatic-0.39.zip


# Removing all tar and zip files.
rm -rf SPAdes-3.15.0-Linux.tar.gz
rm -rf quast-5.3.0.tar.gz
rm -rf fastqc_v0.12.1.zip
rm -rf Trimmomatic-0.39.zip


echo ""
echo "To run SPAdes use 'python3 ./SPAdes-3.15.0-Linux/bin/spades.py'"
echo "To run quast  use 'python3 ./quast-5.3.0/quast.py'"
echo "To run fastqc  use './FastQC/fastqc'"
echo "To run Trimmomatic  use 'java -jar ./Trimmomatic-0.39/trimmomatic-0.39.jar'"
