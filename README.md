# RNA-Seq-project
This is my RNA seq project for my fall 2024 genomics/bioinformatics course

## Background
Candida albicans is a commensal yeast that that can cause a variety of pathologies- i.e., urinary tract, genital, mucosal and blood infections. The Rolfes lab seeks to understand how C. albicans shifts from its commensal form to its pathogenic form, insights that can inform intervention efforts. Thiamine, also known as vitamin B1, is a growth factor for C. albicans. As such, understanding changes in gene expression in the absence and presence of Thiamine will allow for the classification of specific genes that encode for growth and pathogenicity. 

## Experimental Design
One strain was grown in the presence of thiamine; one strain was grown in the absence of thiamine. There were three biological replicates for each condition, with two read pairs for each replicate, resulting in 12 total sequence files: 
<img width="438" alt="image" src="https://github.com/user-attachments/assets/08aced93-4d6d-46db-ba2c-77d6e75795ac">

I specifically focused on analyzing the read pair WTC2_1.fq.gz and WTC2_2.fq.gz. 

## Analysis goals
- Quality control (QC)
(FastQC & Trimmomatic)
- Map (align) reads to reference
(Bowtie2)-> sam/bam file
- Count Reads per gene model
(HTseq)
- Differential expression analysis
(DEseq2 in R)
- Gene Ontology Enrichment analysis

## Data files
I analyzed the WTC2_1.fq.gz and WTC2_2.fq.gz read pair from the class google bucket. I used NCBI's reference genome sequence and gtf annotation file for Candida albicans (GCF_000182965.3). 
