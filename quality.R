setwd('~/projects/final-excs')
library(tidyverse)

#plotting distribution of quality over the whole genome
read_tsv('data/data-gen-prep.tsv') -> d
ggplot(d, aes(POS, QUAL)) + geom_point(size = 0.05) + geom_smooth() + xlab('POSITION') + ylab('QUALITY')

#plotting distribution of quality over first five chromosomes 
#(could not plot all, too much data)
read_tsv('data/data-chr-prep.tsv', col_names = c("CHROM", "POS", "QUAL")) -> g
g %>%
  group_by(CHROM) %>%
  mutate(POS_block = plyr::round_any(POS, 1e6)) %>%
  ggplot(aes(POS, QUAL)) + geom_point(size = 0.05) + facet_wrap(~CHROM, ncol = 1) + xlab('POSITION') + ylab('QUALITY')
