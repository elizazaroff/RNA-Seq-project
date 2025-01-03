# Master Notes

## Quality Control: FastQC & Trimmomatic
10/31: 

First, I ran FASTQC on the raw files: WTC2_1.fq.gz and WTC2_2.fq.gz

Using the FASTQC results, I designed a trimmomatic script ("Trimmomatic Script 10.31") to address the quality issues that appeared in the FASTQC analysis. Then, I ran the paired end output files through FASTQC to ensure that the trimming and quality control had worked. FASTQC results after trimming can be found in the FASTQC folder. 

Link to google sheet with summary of number of reads per library and % reads lost during cleaning for all the data files: https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0. 

## Map (align) reads to reference: Bowtie2
11/5: 

Used bowtie2/2.3.5 to align the trimmed reads—WTC2_1_trPE.fq and WTC2_2_trPE.fq—to the reference genome, using the script "Bowtie Script 11.5."

The refseq genome sequence and gtf annotation file for Candida albicans was GCF_000182965.3, accessed from NCBI. The filenames were GCF_000182965.3_ASM18296v3_genomic.fna.gz and GCF_000182965.3_ASM18296v3_genomic.gtf.gz. 

Link to google sheet summarizing the alignment results for all the data files: https://docs.google.com/spreadsheets/d/1fa-FXVMlCXOZkbHSx_mMg0OXLMy9BeBJg8uWrEMpKGo/edit?gid=0#gid=0.


## Count Reads per gene model: HTseq
11/17:

I used samtools to convert the sam file (the output from the bowtie alignment: WTC2.sam) to a bam file (WTC2.bam), as well as sort and index the bam file (WTC2.srt.bam.bai). To count and assign reads to genes, I ran the sorted bam file (WTC2.srt.bam) along with the annotated GTF file (GCF_000182965.3_ASM18296v3_genomic.gtf) through HTseq using the script "HTseq Script 11.17."

## Differential expression analysis: DEseq2 in R
11/26:

To identify and measure differential expression analysis, I compiled all of the HTseq output files from the experiment (WTA2_htseqCount, WTB2_htseqCount, WTC2_htseqCount, WTB1_htseqCount, WTC1_htseqCount, WTA1_htseqCount), and analyzed them in R using "R Script 11.26." The script works by inputting the HTSeq data files, making a DESEQ database from HTSeq count data, and then filtering the data by keeping only genes with >10 reads across all samples/libraries. Next, it sets reference conditions (TH_ = TH+, => + Fold Change values means transcript abundance higher under TH- conditions), conducts quality control and PCA Visualization to stabilize variance low read counts, and finally runs a DEG analysis. The R output included two summary Excel sheets (Sig. genes, all genes), a PCA plot, and a Volcano plot, and can be found in the folder "R Output Files." 

To elucidate the biological significance of the upregulation of the genes under thiamine-absent conditions, I combined information from the GTF file with information from DESeq2, using locus tags to align the data. Using the gene names and gene IDs pulled from the GTF file, I researched the genes that were significantly upregulated and created a summary table with notes on the biological function of each of these genes, which can be found in the "R Output Files" folder. 


## Gene Ontology Enrichment Analysis
12/3:

To gain a higher-level understanding of the biological changes occurring under thiamine-absent conditions, I performed a Gene Ontology (GO) enrichment analysis on the genes that were significantly upregulated. I used Panther to run a Fisher's Exact test, using the "GO biological process complete" annotation data set and calculating the False Discovery Rate. The output file from the GO enrichment analysis can be found in the "GO Analysis Output" folder. 
