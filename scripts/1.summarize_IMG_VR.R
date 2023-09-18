# This script is for taking all names of human-associated viral contigs in IMGVR v4.

getwd()
setwd('~/crisprome/virome_database/scripts/')
total <- read.table('../raw_databases/7.IMG_VR/IMG_VR/IMG_VR_2022-12-19_7/IMGVR_all_Sequence_information.tsv', 
                    sep = '\t', header = T)
ecosystem <- as.data.frame(total$Ecosystem.classification)
ecosystem <- ecosystem %>% separate(`total$Ecosystem.classification`, sep = ';',
                                    into = c('source', 'host', 'system', 'organ'))
ecosystem[ecosystem == ''] <- 'Unclassified'

uvigs <- cbind(total, ecosystem)
possible_human_uvigs <- uvigs[str_detect(uvigs$host, 'Human'), ]
#possible_human_uvigs <- rbind(possible_human_uvigs, uvigs[str_detect(uvigs$host, 'Unclassified'), ])
possible_human_uvigs <- possible_human_uvigs %>% mutate(seq_name = case_when(
  Coordinates..whole.if.the.UViG.is.the.entire.contig. == 'whole' ~ as.character(paste(UVIG, Taxon_oid, Scaffold_oid, sep = '|')),
  Coordinates..whole.if.the.UViG.is.the.entire.contig. != 'whole' ~ as.character(paste(UVIG, Taxon_oid, Scaffold_oid, Coordinates..whole.if.the.UViG.is.the.entire.contig., sep = '|'))
))
possible_human_uvigs %>% write.table('../intermediates/1.IMGVR_summary/1-1.uvigs_possible_human_associated.txt', 
            quote = F, col.names = T, row.names = F)
clustered_possible_human_uvigs <- possible_human_uvigs %>% group_by(vOTU) %>% 
  summarise(vOTU_size = n(),
            max_uvig_length = max(Length))
clustered_possible_human_uvigs %>% ggplot(aes(x = vOTU_size)) + 
  geom_histogram() + 
  scale_x_continuous(limits = c(0, 10))
possible_human_uvigs$seq_name %>% write.table('../intermediates/1.IMGVR_summary/1-2.uvigs_names_possible_human_associated.txt', 
                                     quote = F, col.names = F, row.names = F)
