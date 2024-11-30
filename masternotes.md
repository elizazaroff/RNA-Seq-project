# Master Notes

## Quality Control: FastQC & Trimmomatic
10/31: 

First, I ran FASTQC on the raw files: WTC2_1.fq.gz and WTC2_2.fq.gz

Using the FASTQC results, I designed a trimmomatic script ("Trimmomatic Script 10.31") to address the quality issues that appeared in the FASTQC analysis. Then, I ran the paired end output files through FASTQC to ensure that the trimming and quality control had worked. FASTQC results after trimming can be found in the FASTQC folder. 

## Map (align) reads to reference: Bowtie2
11/5: 

Used bowtie2/2.3.5 to align the trimmed reads—WTC2_1_trPE.fq and WTC2_2_trPE.fq—to the reference genome, using the script "Bowtie Script 11.5."

The refseq genome sequence and gtf annotation file for Candida albicans was GCF_000182965.3, accessed from NCBI. The filenames were GCF_000182965.3_ASM18296v3_genomic.fna.gz and GCF_000182965.3_ASM18296v3_genomic.gtf.gz. 




## Count Reads per gene model: HTseq
11/17

I used samtools to convert the sam file (the output from the bowtie alignment) to a bam file, as well as sort and index the bam file. To count and assign reads to genes, I ran the sorted, indexed bam file along with the annotated GTF file (GCF_000182965.3_ASM18296v3_genomic.gtf) through HTseq using the script "HTseq Script 11.17."

## Differential expression analysis: DEseq2 in R
## Gene Ontology Enrichment Analysis
