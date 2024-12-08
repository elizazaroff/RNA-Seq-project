# RNA-Seq-project
This is my RNA seq project for my fall 2024 genomics/bioinformatics course

## Background
Candida albicans is a commensal yeast that that can cause a variety of pathologies- i.e., urinary tract, genital, mucosal and blood infections. The Rolfes lab seeks to understand how C. albicans shifts from its commensal form to its pathogenic form, insights that can inform intervention efforts. Thiamine, also known as vitamin B1, is a growth factor for C. albicans, and its availability significantly affects C. albicans growth and metabolism. As such, by comparing gene expression in the presence and absence of thiamine, the Rolfes lab can identify genes critical for growth and pathogenicity. Understanding thiamine-dependent gene regulation may provide insights into potential therapeutic targets, as thiamine plays a role in reducing reactive oxygen species (ROS) generation in Candida species. 

## Experimental Design
One strain was grown in the presence of thiamine; one strain was grown in the absence of thiamine. There were three biological replicates for each condition, with two read pairs for each replicate, resulting in 12 total sequence files: 
<img width="438" alt="image" src="https://github.com/user-attachments/assets/08aced93-4d6d-46db-ba2c-77d6e75795ac">

I specifically focused on analyzing the read pair WTC2_1.fq.gz and WTC2_2.fq.gz. 

## Analysis goals
The analysis goals for this experiment encompassed a comprehensive pipeline to process and interpret the RNA-seq data. The workflow began with quality control measures, utilizing FastQC to assess the raw sequencing data quality and Trimmomatic to trim low-quality reads and remove adapters. Following QC, the cleaned reads were mapped to a reference genome using Bowtie2, generating SAM/BAM files that represented the alignment of reads to genomic locations. HTseq was then employed to count the number of reads mapping to each gene model, providing a quantitative measure of gene expression. The core of the analysis involved differential expression analysis using DEseq2 in R, which identified genes that were significantly up or downregulated between the thiamine-present and thiamine-absent conditions. Finally, a Gene Ontology Enrichment analysis was performed to categorize the differentially expressed genes into functional groups, offering insights into the biological processes, molecular functions, and cellular components affected by thiamine availability in Candida albicans.

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

## Results and Interpretation 
Volcano Plot:
The volcano plot reveals that there are several significant changes in gene expression between the strains grown in the absence of thiamine and the strains grown in the presence of thiamine. Specifically, a small subset of genes (13 total), located on the right side of the x-axis (positive Log₂FC), appear to be overexpressed in the thiamine-deprived strain, meeting both statistical significance and fold-change thresholds (red points). Therefore, these 13 genes are likely core players in thiamine-deprivation responses and are of high interest for further investigation.

PCA Plot:

Summary Table: 

GO Enrichment Analysis: 
