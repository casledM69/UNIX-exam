#!/bin/bash

#Prepare project directory, and make it your working directory
#Then prepare the source file to the directory

#mkdir final-excs
mkdir data
cp /data-shared/vcf_examples/luscinia_vars.vcf.gz data
cd data

INPUT=luscinia_vars.vcf.gz

#made a variable to not have to write the long name while working with it
#can check the file with zcat $INPUT | less -S
#we only need CHROM, POS and QUAL columns, so we will remove all the lines starting with '##'
#then we will get desired columns
#we want to keep their names and so we will remove just the first '#', to have it tidy
#save the result to a new file to work with later
zcat $INPUT | grep -v '^##' | cut -f1,2,6 | tail -c +2 > data-gen-prep.tsv

#we will also create a file with first five chromosomes only (for plotting over chromosomes)
< data-gen-prep.tsv grep '^chr[1-5]\s' > data-chr-prep.tsv
