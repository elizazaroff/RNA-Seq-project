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

### PCA Plot: 

The PCA (Principal Component Analysis) plot reveals a clear separation between thiamine-present (THI+) and thiamine-absent (THI-) conditions in the C. albicans samples. Specifically, there is a clear vertical separation between the thiamine-absent and thiamine-present conditions (indicated by the blue vs red dots), which suggests distinct transcriptional profiles. The high percentage of variance explained by PC1 (88%) indicates that thiamine availability is the dominant factor driving gene expression differences in this experiment. The secondary component explains a smaller (9%) portion of the variance, likely reflecting individual sample variation or biological/technical noise. Additionally, the separation along PC1 between THI+ and THI- conditions highlights a significant difference in gene expression driven by the presence or absence of thiamine, and the minimal overlap between the two groups underscores the reliability of the experimental design and the reproducibility of the RNA-seq data. In terms of replicate consistency, replicates for both THI+ and THI- conditions cluster tightly, which indicates low variability within each treatment group. This suggests high-quality RNA-seq data and consistent experimental conditions. In conclusion, since PC1 accounts for the vast majority of variance (88%), it is likely dominated by the presence versus absence of thiamine rather than by subtle differences within replicates or noise, further confirming that thiamine availability induces substantial changes in global gene expression in C. albicans. 

### Volcano Plot:

The volcano plot allowed us to identify specific genes that are both biologically meaningful and statistically significant, revealing that there are several significant changes in gene expression between the strains grown in the absence of thiamine and the strains grown in the presence of thiamine. Specifically, a subset of genes (13 total) are represented by red dots, indicating that they pass both the log2 fold change threshold and the statistical significance threshold. These genes are, therefore, significantly upregulated in the thiamine-absent condition compared to the thiamine-present condition, with some genes showing very high statistical significance (-log10(p-adjusted) > 100) and substantial fold changes (log2FC > 5). Therefore, these 13 genes are likely core players in thiamine-deprivation responses and are of high interest for further investigation.

### Summary Table: 

The summary table shows gene annotations from both the Candida Genome and UniProt databases for the 13 significantly differentially expressed genes in the thiamine study, allowing us to elucidate the biological significance of each gene on an individual level. From the table, it is clear that multiple genes are involved in thiamine biosynthesis and pyridoxine (vitamin B6) synthesis pathways, and several genes encode phosphatases and synthases specific to thiamine metabolism. This makes sense, as the strain is likely trying to compensate for being in a thiamine-deprived environment. Some of the genes also serve as thiamine and amino acid transporters, as well as membrane-associated transport proteins, though research into the characterization of these genes remains limited. Interestingly, several genes are marked as "Spider biofilm induced," suggesting a connection between thiamine metabolism and biofilm formation. Therefore, the gene functions strongly support the experimental focus on thiamine metabolism and suggest broader connections to vitamin B synthesis pathways and biofilm formation in C. albicans. In other words, the table demonstrates that thiamine deprivation triggers a complex transcriptional response involving not just thiamine-specific pathways but also broader vitamin B metabolism and virulence-associated functions in C. albicans.

### GO Enrichment Analysis: 

The enrichment analysis allowed us to group the 13 significantly upregulated genes into broader biological processes and pathways, elucidating the specific biological processes affected by thiamine availability in C. albicans. 

The primary enriched pathways included thiamine-related processes, with the thiamine biosynthetic process showing >100 fold enrichment with extremely low FDR (1.11E-07), thiamine metabolic process and thiamine-containing compound pathways also showing >100 fold enrichment, and while these pathways only involve 4-6 genes, they show very high statistical significance (p-values ~10^-10). Vitamin B6 pathways were also notably enriched, with the pyridoxine biosynthetic process showing >100 fold enrichment and the pyridoxal phosphate biosynthetic process showing >100 fold enrichment with FDR of 9.19E-03. 

The secondary enriched pathways included alcohol metabolism, with the primary alcohol biosynthetic process having >100 fold enrichment, the alcohol metabolic process having 15.22 fold enrichment, and the secondary alcohol biosynthetic process having 11.12 fold enrichment. Other metabolic processes included organic hydroxy compound biosynthetic process (22.00 fold enrichment), small molecule metabolic process (6.11 fold enrichment), and ergosterol biosynthetic process (11.25 fold enrichment). 

In summary, there are several highly significant pathways, with multiple pathways showing very low FDR values (<1E-07), strong p-values (many at 6.47E-11 or lower), and fold enrichment values >100 for key thiamine and vitamin-related processes. From the analysis, it is evident that C. albicans appears to upregulate key metabolic and biosynthetic processes to adapt to thiamine deprivation, specifically by activating endogenous thiamine production and salvage pathways as well as possibly altering small molecule metabolism, including pyrimidines and sulfur compounds. The data reaffirms thiamine's importance not only in primary metabolism but also in reducing oxidative stress and maintaining cellular redox balance. On a broader level, this enrichment analysis confirms that thiamine deprivation triggers a coordinated transcriptional response affecting multiple interconnected metabolic pathways, with thiamine and vitamin B-related processes being the most significantly affected. The enrichment patterns suggest a hierarchical response where thiamine deprivation primarily affects vitamin B-related processes, followed by broader metabolic adaptations in alcohol and sterol metabolism.

## Conclusion

Enrichment of thiamine-related biosynthesis and metabolic pathways suggests potential antifungal strategies:
Targeting enzymes involved in thiamine biosynthesis could weaken C. albicans in thiamine-depleted environments (e.g., infection sites).
Inhibiting stress-related metabolic pathways (e.g., organic hydroxy compound metabolism) may enhance fungal susceptibility to host defenses.
