## script to generate supplementary file 3
library(dplyr)
library(readr)
library(magrittr)
library(stringr)
library(tibble)
library(tidyr)

meta <- read_csv("../tables/metasub_singapore/complete_metadata.csv")
missing_dat <- filter(meta, is.na(meta$metasub_name))$uuid
meta %<>% 
  filter(!(uuid %in% missing_dat)) %>% 
  mutate(uuid = str_remove(uuid, "hai.*XY_")) %>% 
  mutate(location = "MetaSUB") %>% 
  filter(surface %in% c("handrail",
                        "lift_buttons",
                        "overhead_handrail",
                        "pedestrian_crossing_button",
                        "playground",
                        "seat",
                        "table",
                        "exercise_hand_grip")) %>% 
  select(uuid, location)

meta_hosp <- read_tsv("../metadata/illumina_metadata.txt") %>% 
  select(Library, Room_type, Sample_type) %>%
  filter(Room_type != "Mock") %>% 
  filter(!str_detect(Room_type, "Control")) %>% 
  rename("uuid" = "Library") %>% 
  mutate(location = if_else(Room_type == "GIS", "Office",
                            if_else(Sample_type == "Aerator" | Sample_type == "Sink_Trap", "CTB", "CTA"))) %>% 
  select(uuid, location)

meta.all <- rbind(meta, meta_hosp)


#### Species data
dat_hosp <- read_tsv("../tables/metagenomics.metaphlan2.table.s")
dat <- read_tsv("../tables/metasub_singapore/s.metaphlan2.profile_merged.tsv")

dat_merged <-
  merge(dat, dat_hosp, by = "Index", all = TRUE) %>%
  #column_to_rownames("Index") %>% 
  replace(is.na(.) | .<0.1, 0) %>% 
  filter(rowSums(.[,-1])>0) %>% 
  mutate(Index=str_replace_all(Index, c('s__'='', '_'=' '))) 

write.table(dat_merged[, colnames(dat_merged) %in% c('Index', meta.all$uuid)], '../output_tables/metagenomics.metaphlan2.singapore.all.s.tsv',
            quote=F, sep='\t', row.names=F, col.names=T)

  
#### Antibiotics data
dat_metasub <- read_tsv("../tables/metasub_singapore/arg_metasub.dat")
dat_gis_hosp <- read_tsv("../tables/illumina_AR_gene_assignment.dat")

dat <- rbind(dat_metasub, dat_gis_hosp) %>% 
  filter(Lib %in% meta.all$uuid)

dat.wide <- mutate(dat, Cover=(Cover>0)*1) %>% 
  pivot_wider(id_cols = Lib, names_from = Anti, values_from = Cover, values_fill = c(Cover=0)) 

bind_rows(dat.wide, tibble(Lib=setdiff(meta.all$uuid, dat.wide$Lib))) %>% 
  replace(is.na(.), 0) %>% column_to_rownames('Lib') %>% 
  t %>% 
  write.table('../output_tables/metagenomics.arg.singapore.all.tsv',
              quote=F, sep='\t', row.names=T, col.names=NA)
