#!/bin/bash
#SBATCH --job-name=trimmomatic_hw4_2_variables --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=erz12@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G
#--------------------------------------------------------------------------------------------------------#
# This script runs trimmomatic v0.39 on paired end fastq files and directs output to sub directory "trim_out" #
#--------------------------------------------------------------------------------------------------------#

#- DEFINE VARIABLES WITH FILE LOCATIONS --------------------------------------------------------------#
adapters=/home/erz12/HW4_input_files/TruSeq3-PE.fa

input_R1=/home/erz12/HW4_input_files/EC-12_R1_001.fastq.gz
input_R2=/home/erz12/HW4_input_files/EC-12_R2_001.fastq.gz

output_R1_PE=/home/erz12/HW4_output_files/EC-12_R1_001.trmPE.fq.gz
output_R1_SE=/home/erz12/HW4_output_files/EC-12_R1_001.trmSE.fq.gz
output_R2_PE=/home/erz12/HW4_output_files/EC-12_R2_001.trmPE.fq.gz
output_R2_SE=/home/erz12/HW4_output_files/EC-12_R2_001.trmSE.fq.gz

#---- load module command ----------------------------------------------------------------#
shopt -s expand_aliases
module load trimmomatic
#-- run paired end mode -----------------------------------------------------------------#
trimmomatic PE \
$input_R1 $input_R2 \
$output_R1_PE $output_R1_SE \
$output_R2_PE $output_R2_SE \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:$adapters:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#----- unload module command -----------------------------------------------------#
module unload trimmomatic
#- FIN -----------------------------------------------------------------------#

