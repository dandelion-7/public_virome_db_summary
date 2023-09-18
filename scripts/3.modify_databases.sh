# !/usr/bin/bash
# Virus sequences from each database were annotated with the origin of database, and then merged (2/3/5/6/7) into one large database. HuVirDB is too redundant, so it is constructed into a single blastdb. all_plasmid_seq is constructed into a single blastdb.
cd 2-7.virus_sequences.fasta 
sed -i s/>/>HuVirDb_/g 1.HuVirDB-1.0.fasta
sed -i s/>/>GVD_/g 2.GVDv1_viralpopulations.fna
sed -i -e s/>/>MGV_/g -e s/ /_/g 3.mgv_votu_representatives.fna
sed -i s/>/>CHVD_/ 5.CHVD_virus_sequences_v1.1.fasta
sed -i -e s/\t/-/g -e s/>/>MGE_/g 6.all_phage_seq.fna
sed -i s/>/>MGE_/g 6.all_plasmid_seq.fna
mv 6.all_plasmid_seq.fna  plasmid_seq.fna

